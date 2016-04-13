class ImagesController < InheritedResources::Base
  private

  def image_params
    params.require(:image).permit()
  end
end
