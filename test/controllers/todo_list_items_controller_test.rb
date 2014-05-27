require 'test_helper'

class TodoListItemsControllerTest < ActionController::TestCase
  setup do
    @todo_list_item = todo_list_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todo_list_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todo_list_item" do
    assert_difference('TodoListItem.count') do
      post :create, todo_list_item: { name: @todo_list_item.name, todo_list_id: @todo_list_item.todo_list_id }
    end

    assert_redirected_to todo_list_item_path(assigns(:todo_list_item))
  end

  test "should show todo_list_item" do
    get :show, id: @todo_list_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @todo_list_item
    assert_response :success
  end

  test "should update todo_list_item" do
    patch :update, id: @todo_list_item, todo_list_item: { name: @todo_list_item.name, todo_list_id: @todo_list_item.todo_list_id }
    assert_redirected_to todo_list_item_path(assigns(:todo_list_item))
  end

  test "should destroy todo_list_item" do
    assert_difference('TodoListItem.count', -1) do
      delete :destroy, id: @todo_list_item
    end

    assert_redirected_to todo_list_items_path
  end
end
