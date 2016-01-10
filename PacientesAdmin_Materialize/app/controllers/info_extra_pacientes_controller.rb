class InfoExtraPacientesController < ApplicationController
  before_action :set_info_extra_paciente, only: [:show, :edit, :update, :destroy]

  # GET /info_extra_pacientes
  # GET /info_extra_pacientes.json
  def index
    @info_extra_pacientes = InfoExtraPaciente.all
  end

  # GET /info_extra_pacientes/1
  # GET /info_extra_pacientes/1.json
  def show
  end

  # GET /info_extra_pacientes/new
  def new
    @info_extra_paciente = InfoExtraPaciente.new
  end

  # GET /info_extra_pacientes/1/edit
  def edit
  end

  # POST /info_extra_pacientes
  # POST /info_extra_pacientes.json
  def create
    @info_extra_paciente = InfoExtraPaciente.new(info_extra_paciente_params)

    respond_to do |format|
      if @info_extra_paciente.save
        format.html { redirect_to @info_extra_paciente, notice: 'Info extra paciente was successfully created.' }
        format.json { render :show, status: :created, location: @info_extra_paciente }
      else
        format.html { render :new }
        format.json { render json: @info_extra_paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_extra_pacientes/1
  # PATCH/PUT /info_extra_pacientes/1.json
  def update
    respond_to do |format|
      if @info_extra_paciente.update(info_extra_paciente_params)
        format.html { redirect_to @info_extra_paciente, notice: 'Info extra paciente was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_extra_paciente }
      else
        format.html { render :edit }
        format.json { render json: @info_extra_paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_extra_pacientes/1
  # DELETE /info_extra_pacientes/1.json
  def destroy
    @info_extra_paciente.destroy
    respond_to do |format|
      format.html { redirect_to info_extra_pacientes_url, notice: 'Info extra paciente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_extra_paciente
      @info_extra_paciente = InfoExtraPaciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_extra_paciente_params
      params.require(:info_extra_paciente).permit(:estudiante, :trabajador, :lugar_estudio_trabajo, :hijos, :cant_hijos, :referencia_trab_social, :ayuda_alimentos, :ayuda_medicamento, :fk_id_persona)
    end
end
