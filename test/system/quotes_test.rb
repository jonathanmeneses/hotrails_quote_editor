require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first)
  end
  test "creating a Quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    fill_in "Name", with: "Capybara Quote"
    click_on "Create Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara Quote"


  end

  test "Destroying a Quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
