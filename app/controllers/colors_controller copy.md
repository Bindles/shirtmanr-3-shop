class ColorsController < ApplicationController
  before_action :set_color, only: %i[ show edit update destroy ]

  def pass
    @comesfrom = "pass"
    ac = LogosController.new
    # res = LogosController.dispatch(:logo_data, request, response)
    # res = ac.dispatch(:get, request, response)
    instance_var = ac.instance_variable_get(:@comesfrom)
    instance_var = ac.instance_variable_get(:@passeda)
    LogosController.dispatch(:passtologo, request, response)

    instance_var = ac.instance_variable_get(:@passeda)
    #ac.instance_variable_get(:@passed_var)
    #LogosController.instance_variable_get(:@passed_var)

    # request.params[:item_id] = request.params[:id]
    # res = LogosController.dispatch(:get, request, response)
    # render json: { msg: "OK", body: JSON.parse(res[2].body) }, status: 200
  end


  # def pass
  #   ac = LogosController.new
  #   res = LogosController.dispatch(:get, request, response)
  #   res = ac.dispatch(:get, request, response)
  #   #instance_var = ac.instance_variable_get(:@passed_var)
  #   #ac.instance_variable_get(:@passed_var)
  #   LogosController.instance_variable_get(:@passed_var)
  #   puts @passed_var
  #   puts @passed_two


  #   # request.params[:item_id] = request.params[:id]
  #   # res = LogosController.dispatch(:get, request, response)
  #   # render json: { msg: "OK", body: JSON.parse(res[2].body) }, status: 200
  # end

  # def logofromcolor
  #   LogosController.dispatch(:logo_data, request, response)
  #   #@logo_data = logo_data
  #   #puts @logo_data.inspect
  # end

  def logofromcolor
    @logo_data = fetch_logo_dataz
    puts @logo_data.inspect
  end
  

  def components
    @colors = Color.all
  end

  def new2
    @color = Color.new
    @colors = Color.all
  end
  # GET /colors or /colors.json
  def indexx
    $globvar = 'hii'
    @colors = Color.all
  end

  def index
    $globvar = 'hii'
    @colors = Color.all
  end

  def test
  @color = Color.new
  end
  def appz
  color = Color.new
  puts 'hi'
  puts color
  end


  # GET /colors/1 or /colors/1.json
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
    @colors = Color.all
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors or /colors.json
  def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        # format.html { redirect_to color_url(@color), notice: "Color was successfully created." }
        # format.json { render :show, status: :created, location: @color }
        redirect_to colors_path
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1 or /colors/1.json
  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to color_url(@color), notice: "Color was successfully updated." }
        format.json { render :show, status: :ok, location: @color }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1 or /colors/1.json
  def destroy
    @color.destroy!

    respond_to do |format|
      format.html { redirect_to colors_url, notice: "Color was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def color_params
      params.require(:color).permit(:name, :val)
    end
end
