class InfoContactosController < ApplicationController
  before_action :set_info_contacto, only: [:show, :edit, :update, :destroy]

  # GET /info_contactos
  # GET /info_contactos.json
  def index
    @info_contactos = InfoContacto.all
  end

  # GET /info_contactos/1
  # GET /info_contactos/1.json
  def show
  end

  # GET /info_contactos/new
  def new
    @info_contacto = InfoContacto.new
  end

  # GET /info_contactos/1/edit
  def edit
  end

  # POST /info_contactos
  # POST /info_contactos.json
  def create
    @info_contacto = InfoContacto.new(info_contacto_params)

    respond_to do |format|
      if @info_contacto.save
        format.html { redirect_to @info_contacto, notice: 'Info contacto was successfully created.' }
        format.json { render :show, status: :created, location: @info_contacto }
      else
        format.html { render :new }
        format.json { render json: @info_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_contactos/1
  # PATCH/PUT /info_contactos/1.json
  def update
    respond_to do |format|
      if @info_contacto.update(info_contacto_params)
        format.html { redirect_to @info_contacto, notice: 'Info contacto was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_contacto }
      else
        format.html { render :edit }
        format.json { render json: @info_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_contactos/1
  # DELETE /info_contactos/1.json
  def destroy
    @info_contacto.destroy
    respond_to do |format|
      format.html { redirect_to info_contactos_url, notice: 'Info contacto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_contacto
      @info_contacto = InfoContacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_contacto_params
      params.require(:info_contacto).permit(:telefono, :nombre_contacto, :parentesco, :fk_id_paciente)
    end
end
