class ApplicationController < ActionController::Base

  def fetch_logo_data
    dir_path = "#{Rails.root}/app/assets/images/logo"
    @dpath = "#{Rails.root}/app/assets/images/logo"
    @images = Dir.entries(dir_path).select { |f| File.file?("#{dir_path}/#{f}") }

    @logo_data = @images.map do |image|
      {
        name: File.basename(image, File.extname(image)),
        file: image,
        path: @dpath,
        #image_tag: ActionController::Base.helpers.image_tag("logo/#{image}", class: 'img-1', size: '100x100')
        #url: ActionController::Base.helpers.image_path("logo/#{image}") # Add image URL
      }
    end

    @logo_data

    #respond_to do |format|
      #format.json { render json: @logo_data }
      #format.html {render :logo_data}
    #end
  end
  
end
