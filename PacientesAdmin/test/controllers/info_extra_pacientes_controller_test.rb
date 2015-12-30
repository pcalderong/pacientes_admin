require 'test_helper'

class InfoExtraPacientesControllerTest < ActionController::TestCase
  setup do
    @info_extra_paciente = info_extra_pacientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_extra_pacientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_extra_paciente" do
    assert_difference('InfoExtraPaciente.count') do
      post :create, info_extra_paciente: { ayuda_alimentos: @info_extra_paciente.ayuda_alimentos, ayuda_medicamento: @info_extra_paciente.ayuda_medicamento, cant_hijos: @info_extra_paciente.cant_hijos, estudiante: @info_extra_paciente.estudiante, fk_id_persona: @info_extra_paciente.fk_id_persona, hijos: @info_extra_paciente.hijos, lugar_estudio_trabajo: @info_extra_paciente.lugar_estudio_trabajo, referencia_trab_social: @info_extra_paciente.referencia_trab_social, trabajador: @info_extra_paciente.trabajador }
    end

    assert_redirected_to info_extra_paciente_path(assigns(:info_extra_paciente))
  end

  test "should show info_extra_paciente" do
    get :show, id: @info_extra_paciente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_extra_paciente
    assert_response :success
  end

  test "should update info_extra_paciente" do
    patch :update, id: @info_extra_paciente, info_extra_paciente: { ayuda_alimentos: @info_extra_paciente.ayuda_alimentos, ayuda_medicamento: @info_extra_paciente.ayuda_medicamento, cant_hijos: @info_extra_paciente.cant_hijos, estudiante: @info_extra_paciente.estudiante, fk_id_persona: @info_extra_paciente.fk_id_persona, hijos: @info_extra_paciente.hijos, lugar_estudio_trabajo: @info_extra_paciente.lugar_estudio_trabajo, referencia_trab_social: @info_extra_paciente.referencia_trab_social, trabajador: @info_extra_paciente.trabajador }
    assert_redirected_to info_extra_paciente_path(assigns(:info_extra_paciente))
  end

  test "should destroy info_extra_paciente" do
    assert_difference('InfoExtraPaciente.count', -1) do
      delete :destroy, id: @info_extra_paciente
    end

    assert_redirected_to info_extra_pacientes_path
  end
end
