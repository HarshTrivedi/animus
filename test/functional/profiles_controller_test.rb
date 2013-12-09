require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: sapiens(:shubham).agnomen
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 for profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
  	get :show, id: sapiens(:shubham).agnomen
  	assert assigns(:sapien)
  	assert_not_empty assigns(:thoughts)
  end

  test "that thoughts of only the targeted sapien is displayed" do
  	get :show, id: sapiens(:shubham).agnomen
  	assigns(:thoughts).each do |thought|
  		assert_equal sapiens(:shubham), thought.sapien
  	end
  end

end
