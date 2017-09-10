class ArtsController < ApplicationController

  def draw
    render "draw.html.erb"
  end

  def show
    @users = User.find_by(id: params[:id])
    @arts = Art.find_by(id: params[:id])
    # art_path = Rails.root.to_s + '/public/' + @arts.photo_file_name.split("?")[0]
    art_path = (Rails.root.to_s + '/public/' + @arts.photo.url(:original)).split("?")[0]
    encoded_art = Base64.encode64(open(art_path) { |io| io.read })
    @temp = ENV['clarifaiKey']
    # @data = encoded_art
    response = Unirest.post(
      "https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs",
      headers: {"Authorization" => "Key #{ENV['clarifaiKey']}", "Content-Type" => "application/json"},
      parameters: {
        "inputs" => [
          {
            "data" => {
              "art" => {
                # "url" => "https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg"
                "base64" => encoded_art
              }
            }
          }
        ]
      }.to_json
    )
    @data = response.body

    @photo_name = @drawing_data["outputs"][0]["data"]["concepts"].map { |concept| concept["photo_name"] }
    @photo_name = @photo_name[0..9]
    if @photo.photo_name.include? "bed" 
      @message = "Bed: Feeling sleepy?"
    elsif @photo.photo_name.include? "dog"
      @message = "Dog: Awww, how cute"
    elsif @photo_name.include? "Lightning"
      @message = 'Lightning: How "shocking" to see'
    elsif @photo.photo_name.include? "Water"
      @message = "Water: Wushhhh, Splash, other water sounds..."
    elsif @photo_name.include? "Person"
      @message = "Person: I see a person...I know, I'm a genius"
    elsif @photo_name.include? "car"
      @message = "Car: Honk!!"
    elsif @photo_name.include? "House"
      @message = "House: Theres no place like home"
    elsif @photo_name.include? "Sword"
      @message = "Sword: A true blade indeed"
    end   
    render "show.json.jbuilder"
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