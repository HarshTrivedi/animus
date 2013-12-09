require 'test_helper'

class ThoughtsControllerTest < ActionController::TestCase
  setup do
    @thought = thoughts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thoughts)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_sapien_session_path
  end

  test "should render the new page when logged in" do
    sign_in sapiens(:shubham)
    get :new
    assert_response :success
  end

  test "should be logged in to think" do
    post :create, thought: {content: "think"}
    assert_response :redirect
    assert_redirected_to new_sapien_session_path
  end

  test "should be able to think when logged in" do
    sign_in sapiens(:shubham)

    assert_difference('Thought.count') do
      post :create, thought: { content: @thought.content}
    end

    assert_redirected_to thought_path(assigns(:thought))
  end

  test "should be able to post for current sapien when logged in" do
    sign_in sapiens(:shubham)

    assert_difference('Thought.count') do
      post :create, thought: { content: @thought.content, sapien_id: sapiens(:harsh).id }
    end

    assert_redirected_to thought_path(assigns(:thought))
    assert_equal assigns(:thought).sapien_id, sapiens(:shubham).id
  end

  test "should show thought" do
    get :show, id: @thought
    assert_response :success
  end

  test "should not get edit when not logged in" do
    get :edit, id: @thought
    assert_response :redirect
    assert_redirected_to new_sapien_session_path
  end

  test "should not update thought when not logged in" do
    put :update, id: @thought, thought: { content: @thought.content}
    assert_response :redirect
    assert_redirected_to new_sapien_session_path
  end

  test "should update when logged in" do
    sign_in sapiens(:shubham)
    put :update, id: @thought, thought: { content: @thought.content}
    assert_response :redirect
    assert_redirected_to thought_path(assigns(:thought))
  end

  test "should update for curent sapien when logged in" do
    sign_in sapiens(:shubham)
    put :update, id: @thought, thought: { content: @thought.content, sapien_id: sapiens(:harsh).id }
    assert_redirected_to thought_path(assigns(:thought))
    assert_equal assigns(:thought).sapien_id, sapiens(:shubham).id
  end

  test "should not update thought when nothing has changed" do
    sign_in sapiens(:shubham)
    put :update, id: @thought
    assert_redirected_to thought_path(assigns(:thought))
    assert_equal assigns(:thought).sapien_id, sapiens(:shubham).id
  end

  test "should destroy thought" do
    assert_difference('Thought.count', -1) do
      delete :destroy, id: @thought
    end

    assert_redirected_to thoughts_path
  end
end
