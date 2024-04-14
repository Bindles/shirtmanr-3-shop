class LogosController < ApplicationController
  before_action :set_logo, only: %i[ show edit update destroy ]

  def app
    dir_path = "#{Rails.root}/app/assets/images/logo"
    @dpath = "#{Rails.root}/app/assets/images/logo"
    @images = Dir.entries(dir_path).select { |f| File.file?("#{dir_path}/#{f}") }

    # Debugging
    puts "Directory Path: #{dir_path}"
    puts @dpath
    puts "Files in Directory: #{@images}"
    puts @logo_data

    @logo_data = @images.map do |image|
      {
        name: File.basename(image, File.extname(image)),
        file: image,
      }
    end

    respond_to do |format|
      format.html {render :app}
      format.json { render json: app }
    end

  end

  # New action to respond to JSON fetch request
  def logo_data
    dir_path = "#{Rails.root}/app/assets/images/logo"
    @dpath = "#{Rails.root}/app/assets/images/logo"
    @images = Dir.entries(dir_path).select { |f| File.file?("#{dir_path}/#{f}") }

    @logo_data = @images.map do |image|
      {
        name: File.basename(image, File.extname(image)),
        file: image,
      }
    end

    respond_to do |format|
      format.json { render json: @logo_data }
      format.html {render :logo_data}
    end
  end

  def rename
    old_name = params[:old_name]
    new_name = params[:new_name]

    Rails.logger.info("Received params: dpath=#{@dpath}, old_name=#{old_name}, new_name=#{new_name}")

    if old_name.present? && new_name.present?
      old_path = File.join("#{Rails.root}/app/assets/images/logo", "#{old_name}.png")
      new_path = File.join("#{Rails.root}/app/assets/images/logo", "#{new_name}.png")

      Rails.logger.info("Old path: #{old_path}")
      Rails.logger.info("New path: #{new_path}")

      if File.exist?(old_path)
        File.rename(old_path, new_path)
      else
        Rails.logger.error("File not found at #{old_path}")
      end
    else
      Rails.logger.error("Both old_name and new_name must be present")
    end

    redirect_to app_logos_path
  end


  # GET /logos or /logos.json
  def index
    @logos = Logo.all
  end

  # GET /logos/1 or /logos/1.json
  def show
  end

  # GET /logos/new
  def new
    @logo = Logo.new
  end

  # GET /logos/1/edit
  def edit
  end

  # POST /logos or /logos.json
  def create
    @logo = Logo.new(logo_params)

    respond_to do |format|
      if @logo.save
        format.html { redirect_to logo_url(@logo), notice: "Logo was successfully created." }
        format.json { render :show, status: :created, location: @logo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logos/1 or /logos/1.json
  def update
    respond_to do |format|
      if @logo.update(logo_params)
        format.html { redirect_to logo_url(@logo), notice: "Logo was successfully updated." }
        format.json { render :show, status: :ok, location: @logo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logos/1 or /logos/1.json
  def destroy
    @logo.destroy!

    respond_to do |format|
      format.html { redirect_to logos_url, notice: "Logo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logo
      @logo = Logo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def logo_params
      params.require(:logo).permit(:name, :img)
    end
end
