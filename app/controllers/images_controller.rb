class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to page_path(current_user.id), notice: "写真を追加しました！"
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
