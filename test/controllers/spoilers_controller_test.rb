require 'test_helper'

class SpoilersControllerTest < ActionController::TestCase
  setup do
    @spoiler = spoilers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spoilers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spoiler" do
    assert_difference('Spoiler.count') do
      post :create, spoiler: { movie_id: @spoiler.movie_id, synopsis: @spoiler.synopsis, user_id: @spoiler.user_id }
    end

    assert_redirected_to spoiler_path(assigns(:spoiler))
  end

  test "should show spoiler" do
    get :show, id: @spoiler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spoiler
    assert_response :success
  end

  test "should update spoiler" do
    patch :update, id: @spoiler, spoiler: { movie_id: @spoiler.movie_id, synopsis: @spoiler.synopsis, user_id: @spoiler.user_id }
    assert_redirected_to spoiler_path(assigns(:spoiler))
  end

  test "should destroy spoiler" do
    assert_difference('Spoiler.count', -1) do
      delete :destroy, id: @spoiler
    end

    assert_redirected_to spoilers_path
  end
end
