require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Tic Tac Toe"
  end

  test "move a Game" do
    visit games_url
    page.find("#index_00").click
    page.find("#index_01").click
    page.find("#index_11").click
    page.find("#index_21").click
    accept_alert do
      page.find("#index_22").click
    end
  end

  test "updating a Game" do
    visit games_url
    click_on "Start new game"
  end
end
