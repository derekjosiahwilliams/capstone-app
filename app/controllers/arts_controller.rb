class ArtsController < ApplicationController

  def draw
    render "draw.html.erb"
  end

  def show
    @users = User.find_by(id: params[:id])
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