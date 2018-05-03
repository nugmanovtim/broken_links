require 'test_helper'

class BrokenLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get broken_links_index_url
    assert_response :success
  end

  test "should get go" do
    get broken_links_go_url
    assert_response :success
  end

end
