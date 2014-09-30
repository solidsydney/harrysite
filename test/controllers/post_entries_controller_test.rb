require 'test_helper'

class PostEntriesControllerTest < ActionController::TestCase
  setup do
    @post_entry = post_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_entry" do
    assert_difference('PostEntry.count') do
      post :create, post_entry: { active: @post_entry.active, body: @post_entry.body, email: @post_entry.email, name: @post_entry.name, summary: @post_entry.summary, title: @post_entry.title }
    end

    assert_redirected_to post_entry_path(assigns(:post_entry))
  end

  test "should show post_entry" do
    get :show, id: @post_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_entry
    assert_response :success
  end

  test "should update post_entry" do
    patch :update, id: @post_entry, post_entry: { active: @post_entry.active, body: @post_entry.body, email: @post_entry.email, name: @post_entry.name, summary: @post_entry.summary, title: @post_entry.title }
    assert_redirected_to post_entry_path(assigns(:post_entry))
  end

  test "should destroy post_entry" do
    assert_difference('PostEntry.count', -1) do
      delete :destroy, id: @post_entry
    end

    assert_redirected_to post_entries_path
  end
end
