require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @team = @user.team
    @lists = @team.lists
    login_as @user
  end

  test "should get index" do
    get lists_url
    assert_response :success
  end

  test "should show list" do
    get list_url(@lists.last)
    assert_response :success
  end

  test "should create list" do
    assert_difference("List.count") do
      post lists_url, params: { list: { name: "name", product_id: @team.products.last.id, qualification_id: @team.qualifications.last.id } }
    end
    assert_redirected_to list_path(@lists.last)
  end

  test "should update list" do
    list = @lists.last
    patch list_url(list), params: { list: { name: "Updated", product_id: @team.products.first.id, qualification_id: @team.qualifications.first.id } }
    assert_redirected_to list_path(list)
    list.reload
    assert_equal "Updated", list.name
    assert_equal @team.qualifications.first, list.qualification
    assert_equal @team.products.first, list.product
  end

  test "should destroy list" do
    list = @lists.last
    assert_difference("List.count", -1) do
      delete list_url(list)
    end
    assert_redirected_to lists_path
  end
end
