require 'test_helper'

class DireccionsControllerTest < ActionController::TestCase
  setup do
    @direccion = direccions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:direccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create direccion" do
    assert_difference('Direccion.count') do
      post :create, direccion: { canton: @direccion.canton, direccion_exacta: @direccion.direccion_exacta, distrito: @direccion.distrito, fk_id_persona: @direccion.fk_id_persona, provincia: @direccion.provincia }
    end

    assert_redirected_to direccion_path(assigns(:direccion))
  end

  test "should show direccion" do
    get :show, id: @direccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @direccion
    assert_response :success
  end

  test "should update direccion" do
    patch :update, id: @direccion, direccion: { canton: @direccion.canton, direccion_exacta: @direccion.direccion_exacta, distrito: @direccion.distrito, fk_id_persona: @direccion.fk_id_persona, provincia: @direccion.provincia }
    assert_redirected_to direccion_path(assigns(:direccion))
  end

  test "should destroy direccion" do
    assert_difference('Direccion.count', -1) do
      delete :destroy, id: @direccion
    end

    assert_redirected_to direccions_path
  end
end
