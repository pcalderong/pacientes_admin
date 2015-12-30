require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post :create, persona: { cedula: @persona.cedula, correo_electronico: @persona.correo_electronico, estado_civil: @persona.estado_civil, fecha_nacimiento: @persona.fecha_nacimiento, genero: @persona.genero, nombre: @persona.nombre, primer_apellido: @persona.primer_apellido, segundo_apellido: @persona.segundo_apellido, telefono: @persona.telefono }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should show persona" do
    get :show, id: @persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @persona
    assert_response :success
  end

  test "should update persona" do
    patch :update, id: @persona, persona: { cedula: @persona.cedula, correo_electronico: @persona.correo_electronico, estado_civil: @persona.estado_civil, fecha_nacimiento: @persona.fecha_nacimiento, genero: @persona.genero, nombre: @persona.nombre, primer_apellido: @persona.primer_apellido, segundo_apellido: @persona.segundo_apellido, telefono: @persona.telefono }
    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_path
  end
end
