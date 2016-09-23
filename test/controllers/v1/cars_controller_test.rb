require 'test_helper'

class V1::CarsControllerTest < ActionController::TestCase
  setup do
    Rails.cache.clear
  end

  test 'should get eta for my position' do
    get :eta, { lat: 55.793837, lon: 49.124756 }
    assert_response :success
    assert_equal 1161.7069112549998, json_response[:eta]

    # here should be cached response

    get :eta, { lat: 55.793836, lon: 49.124757 }
    assert_response :success
    assert_equal 1161.7069112549998, json_response[:eta]
  end

  test 'should check for correct float passed' do
    get :eta, { lat: '55.793837a', lon: 49.124756 }
    assert_response :unprocessable_entity
  end

  test 'should raise error for request' do
    get :eta, { lat: 55.793837 }
    assert_response :unprocessable_entity

    get :eta, { }
    assert_response :unprocessable_entity
  end

end