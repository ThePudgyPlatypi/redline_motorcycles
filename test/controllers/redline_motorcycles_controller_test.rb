require 'test_helper'

class RedlineMotorcyclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get redline_motorcycles_index_url
    assert_response :success
  end

  test "should get repair" do
    get redline_motorcycles_repair_url
    assert_response :success
  end

  test "should get kymco" do
    get redline_motorcycles_kymco_url
    assert_response :success
  end

end
