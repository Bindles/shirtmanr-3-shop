class ApplicationController < ActionController::Base

  def tester

  end


  def fetch_logo_data
    dir_path = "#{Rails.root}/app/assets/images/logo"
    @dpath = "#{Rails.root}/app/assets/images/logo"
    @images = Dir.entries(dir_path).select { |f| File.file?("#{dir_path}/#{f}") }
  
    @logo_data = @images.flat_map do |image|
      # Create 4 copies of each logo
      Array.new(4).map do |index|
        {
          name: "#{File.basename(image, File.extname(image))}_#{index}",
          file: image,
          path: @dpath,
          # Add other attributes if needed
        }
      end
    end
  
    @logo_data
  end

  def fetch_logo_dataz
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
