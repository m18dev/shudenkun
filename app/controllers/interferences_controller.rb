class InterferencesController < ApplicationController
  before_action :set_interference, only: [:show, :edit, :update, :destroy]

  # GET /interferences
  # GET /interferences.json
  def index
    @interferences = Interference.all
  end

  # GET /interferences/1
  # GET /interferences/1.json
  def show
  end

  # GET /interferences/new
  def new
    @interference = Interference.new
  end

  # GET /interferences/1/edit
  def edit
  end

  # POST /interferences
  # POST /interferences.json
  def create
    @interference = Interference.new(interference_params)

    respond_to do |format|
      if @interference.save
        format.html { redirect_to @interference, notice: 'Interference was successfully created.' }
        format.json { render :show, status: :created, location: @interference }
      else
        format.html { render :new }
        format.json { render json: @interference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interferences/1
  # PATCH/PUT /interferences/1.json
  def update
    respond_to do |format|
      if @interference.update(interference_params)
        format.html { redirect_to @interference, notice: 'Interference was successfully updated.' }
        format.json { render :show, status: :ok, location: @interference }
      else
        format.html { render :edit }
        format.json { render json: @interference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interferences/1
  # DELETE /interferences/1.json
  def destroy
    @interference.destroy
    respond_to do |format|
      format.html { redirect_to interferences_url, notice: 'Interference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interference
      @interference = Interference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interference_params
      params.require(:interference).permit(:target_user)
    end
end
