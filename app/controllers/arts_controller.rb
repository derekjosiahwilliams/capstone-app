class ArtsController < ApplicationController

  def create
    @art = Art.create( user_params )
  end

  private

    def art_params
      params.require(:art).permit(:image)
    end

end
