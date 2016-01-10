require 'test_helper'

class HistorialClinicosControllerTest < ActionController::TestCase
  setup do
    @historial_clinico = historial_clinicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_clinicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_clinico" do
    assert_difference('HistorialClinico.count') do
      post :create, historial_clinico: { fecha: @historial_clinico.fecha, fk_id_lookup: @historial_clinico.fk_id_lookup, fk_id_persona: @historial_clinico.fk_id_persona, orden: @historial_clinico.orden }
    end

    assert_redirected_to historial_clinico_path(assigns(:historial_clinico))
  end

  test "should show historial_clinico" do
    get :show, id: @historial_clinico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_clinico
    assert_response :success
  end

  test "should update historial_clinico" do
    patch :update, id: @historial_clinico, historial_clinico: { fecha: @historial_clinico.fecha, fk_id_lookup: @historial_clinico.fk_id_lookup, fk_id_persona: @historial_clinico.fk_id_persona, orden: @historial_clinico.orden }
    assert_redirected_to historial_clinico_path(assigns(:historial_clinico))
  end

  test "should destroy historial_clinico" do
    assert_difference('HistorialClinico.count', -1) do
      delete :destroy, id: @historial_clinico
    end

    assert_redirected_to historial_clinicos_path
  end
end
