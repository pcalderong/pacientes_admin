require 'test_helper'

class LookupDireccionsControllerTest < ActionController::TestCase
  setup do
    @lookup_direccion = lookup_direccions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lookup_direccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lookup_direccion" do
    assert_difference('LookupDireccion.count') do
      post :create, lookup_direccion: { descripcion: @lookup_direccion.descripcion, parent: @lookup_direccion.parent, type: @lookup_direccion.type, value: @lookup_direccion.value }
    end

    assert_redirected_to lookup_direccion_path(assigns(:lookup_direccion))
  end

  test "should show lookup_direccion" do
    get :show, id: @lookup_direccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lookup_direccion
    assert_response :success
  end

  test "should update lookup_direccion" do
    patch :update, id: @lookup_direccion, lookup_direccion: { descripcion: @lookup_direccion.descripcion, parent: @lookup_direccion.parent, type: @lookup_direccion.type, value: @lookup_direccion.value }
    assert_redirected_to lookup_direccion_path(assigns(:lookup_direccion))
  end

  test "should destroy lookup_direccion" do
    assert_difference('LookupDireccion.count', -1) do
      delete :destroy, id: @lookup_direccion
    end

    assert_redirected_to lookup_direccions_path
  end
end
