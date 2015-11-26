require 'test_helper'

class ScanFilesControllerTest < ActionController::TestCase
  setup do
    @scan_file = scan_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scan_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scan_file" do
    assert_difference('ScanFile.count') do
      post :create, scan_file: { result: @scan_file.result }
    end

    assert_redirected_to scan_file_path(assigns(:scan_file))
  end

  test "should show scan_file" do
    get :show, id: @scan_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scan_file
    assert_response :success
  end

  test "should update scan_file" do
    patch :update, id: @scan_file, scan_file: { result: @scan_file.result }
    assert_redirected_to scan_file_path(assigns(:scan_file))
  end

  test "should destroy scan_file" do
    assert_difference('ScanFile.count', -1) do
      delete :destroy, id: @scan_file
    end

    assert_redirected_to scan_files_path
  end
end
