require 'test_helper'

class DiagnosticosControllerTest < ActionController::TestCase
  setup do
    @diagnostico = diagnosticos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diagnosticos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diagnostico" do
    assert_difference('Diagnostico.count') do
      post :create, diagnostico: { description: @diagnostico.description, fecha: @diagnostico.fecha, fk_id_persona: @diagnostico.fk_id_persona }
    end

    assert_redirected_to diagnostico_path(assigns(:diagnostico))
  end

  test "should show diagnostico" do
    get :show, id: @diagnostico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diagnostico
    assert_response :success
  end

  test "should update diagnostico" do
    patch :update, id: @diagnostico, diagnostico: { description: @diagnostico.description, fecha: @diagnostico.fecha, fk_id_persona: @diagnostico.fk_id_persona }
    assert_redirected_to diagnostico_path(assigns(:diagnostico))
  end

  test "should destroy diagnostico" do
    assert_difference('Diagnostico.count', -1) do
      delete :destroy, id: @diagnostico
    end

    assert_redirected_to diagnosticos_path
  end
end
