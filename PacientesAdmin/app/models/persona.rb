class Persona < ActiveRecord::Base
	has_many :info_contactos
	has_one :direccion
	has_one :info_extra_paciente
	has_many :historial_clinicos
end
