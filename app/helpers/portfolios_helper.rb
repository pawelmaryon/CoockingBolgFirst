module PortfoliosHelper
  def image_generator(height:, width:)
    "https://via.placeholder.com/#{height}x#{width}.png"
  end

  def portfoilo_img(img, type)
    if img
      img
    elsif type=="thumb" 
      image_generator(height: '350', width: '200')
    else 
      image_generator(height: '600', width: '400')
    end
  end
end
# def set_defaults
#   self.main_image ||= Placeholder.image_generator(height:600, width:400)
#   self.thumb_image ||= Placeholder.image_generator(height:350, width:200)
# end