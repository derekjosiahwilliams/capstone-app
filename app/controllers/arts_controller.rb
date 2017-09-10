class ArtsController < ApplicationController

  def draw
    render "draw.html.erb"
  end

  def show
    @art = Art.find_by(id: params[:id])
    art_path = (Rails.root.to_s + '/public/' + @art.photo.url(:original)).split("?")[0]
    encoded_art = Base64.encode64(open(art_path) { |io| io.read })
    response = Unirest.post(
      "https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs",
      headers: {"Authorization" => "Key #{ENV['clarifaiKey']}", "Content-Type" => "application/json"},
      parameters: {
        "inputs" => [
          {
            "data" => {
              "image" => {
                # "url" => "https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg"
                "base64" => encoded_art
              }
            }
          }
        ]
      }.to_json
    )
    @data = response.body

    @tags = @data["outputs"][0]["data"]["concepts"].map { |concept| concept["name"] }
    @image = @data["outputs"][0]["input"]["data"]["image"]["url"]
    @tags = @tags[0..5]
    render "show.html.erb"
  end

  def upload
    @users = User.all
    render "new.html.erb"
  end

  def create
    Art.create(
      photo: params[:form_photo_url],
      drawing_data: params[:form_image_url],
      # photo_file_name: params[:form_photo_file_name],
      # photo_content_type: params[:from_photo_content_type],
      user_id: current_user.id
    )

    redirect_to "/"
  end

  private

    def art_params
      params.require(:art).permit(:image)
    end



end