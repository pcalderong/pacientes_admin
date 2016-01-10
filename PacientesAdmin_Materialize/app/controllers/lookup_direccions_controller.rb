class LookupDireccionsController < ApplicationController
  before_action :set_lookup_direccion, only: [:show, :edit, :update, :destroy]

  # GET /lookup_direccions
  # GET /lookup_direccions.json
  def index
    @lookup_direccions = LookupDireccion.all
  end

  # GET /lookup_direccions/1
  # GET /lookup_direccions/1.json
  def show
  end

  # GET /lookup_direccions/new
  def new
    @lookup_direccion = LookupDireccion.new
  end

  # GET /lookup_direccions/1/edit
  def edit
  end

  # POST /lookup_direccions
  # POST /lookup_direccions.json
  def create
    @lookup_direccion = LookupDireccion.new(lookup_direccion_params)

    respond_to do |format|
      if @lookup_direccion.save
        format.html { redirect_to @lookup_direccion, notice: 'Lookup direccion was successfully created.' }
        format.json { render :show, status: :created, location: @lookup_direccion }
      else
        format.html { render :new }
        format.json { render json: @lookup_direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lookup_direccions/1
  # PATCH/PUT /lookup_direccions/1.json
  def update
    respond_to do |format|
      if @lookup_direccion.update(lookup_direccion_params)
        format.html { redirect_to @lookup_direccion, notice: 'Lookup direccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @lookup_direccion }
      else
        format.html { render :edit }
        format.json { render json: @lookup_direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lookup_direccions/1
  # DELETE /lookup_direccions/1.json
  def destroy
    @lookup_direccion.destroy
    respond_to do |format|
      format.html { redirect_to lookup_direccions_url, notice: 'Lookup direccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lookup_direccion
      @lookup_direccion = LookupDireccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lookup_direccion_params
      params.require(:lookup_direccion).permit(:parent, :value, :descripcion, :type)
    end
end
