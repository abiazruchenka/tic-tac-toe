require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should move" do
    post move_games_url, params:{value: '11'}
    assert_response :success
  end

  test "should clean flash" do
    get new_game_url
    assert_redirected_to games_url
  end

end
