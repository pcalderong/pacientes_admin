require 'spreadsheet'
require 'spreadsheet/excel'

class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.all
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)
    # If Genero False = femenino
    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Informacion guardada correctamente.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Informacion actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    book = Spreadsheet.open '/Users/paolacalderon/Documents/ProyectoDaniel/importar-pacientes.xls'
    sheet1 = book.worksheet 0
    sheet1.each 1 do |row|
      @persona = Persona.new
      @persona.nombre = row[0]
      @persona.primer_apellido = row[1]
      @persona.segundo_apellido = row[2]
      @persona.cedula = row[3]
      @persona.telefono = row[4]
      @persona.save
     end
         redirect_to personas_url
  end

  def export
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = 'Informacion Pacientes'
    sheet2 = book.create_worksheet
    sheet2.name = 'Informacion Contactos'
    sheet1.row(0).concat %w{Nombre PrimerApellido SegundoApellido Cedula Telefono}
    sheet2.row(0).concat %w{Nombre Contacto Parentesco Telefono}
    @personas = Persona.all
    i=1
    l=1
    @personas.each do |p|
      sheet1.row(i).push p.nombre, p.primer_apellido, p.segundo_apellido, p.cedula.nil? ? " ":p.cedula, p.telefono.nil? ? " ":p.telefono
      i=i+1
      p.info_contactos.each do |ic|
        l=l+1
        nombre = p.nombre + " " + p.primer_apellido + " " + p.segundo_apellido
        sheet2.row(l).push nombre, ic.nombre_contacto.nil? ? " ": ic.nombre_contacto, ic.parentesco.nil? ? " ":ic.parentesco, ic.telefono.nil? ? " ":ic.telefono
      end
    end
    # sheet1[1,0] = 'Japan'
    # row = sheet1.row(1)
    # row.push 'Creator of Ruby'
    # row.unshift 'Yukihiro Matsumoto'
    # sheet1.row(2).replace [ 'Daniel J. Berger', 'U.S.A.',
    #                         'Author of original code for Spreadsheet::Excel' ]
    # sheet1.row(3).push 'Charles Lowe', 'Author of the ruby-ole Library'
    # sheet1.row(3).insert 1, 'Unknown'
    # sheet1.update_row 4, 'Hannes Wyss', 'Switzerland', 'Author'

    sheet1.row(0).height = 18

    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    book.write '/Users/paolacalderon/Documents/ProyectoDaniel/excel-pacientes.xls'
    redirect_to personas_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:nombre, :primer_apellido, :segundo_apellido, :fecha_nacimiento, :correo_electronico, :genero, :cedula, :estado_civil, :telefono)
    end
end
