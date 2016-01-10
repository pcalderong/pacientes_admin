require 'test_helper'

class InfoContactosControllerTest < ActionController::TestCase
  setup do
    @info_contacto = info_contactos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_contactos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_contacto" do
    assert_difference('InfoContacto.count') do
      post :create, info_contacto: { fk_id_paciente: @info_contacto.fk_id_paciente, nombre_contacto: @info_contacto.nombre_contacto, parentesco: @info_contacto.parentesco, telefono: @info_contacto.telefono }
    end

    assert_redirected_to info_contacto_path(assigns(:info_contacto))
  end

  test "should show info_contacto" do
    get :show, id: @info_contacto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_contacto
    assert_response :success
  end

  test "should update info_contacto" do
    patch :update, id: @info_contacto, info_contacto: { fk_id_paciente: @info_contacto.fk_id_paciente, nombre_contacto: @info_contacto.nombre_contacto, parentesco: @info_contacto.parentesco, telefono: @info_contacto.telefono }
    assert_redirected_to info_contacto_path(assigns(:info_contacto))
  end

  test "should destroy info_contacto" do
    assert_difference('InfoContacto.count', -1) do
      delete :destroy, id: @info_contacto
    end

    assert_redirected_to info_contactos_path
  end
end
