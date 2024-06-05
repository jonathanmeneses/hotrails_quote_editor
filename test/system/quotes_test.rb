require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first)
  end

test "showing a quote" do
  visit quotes_path
  click_link @quote.name

  assert_selector "h1", text: @quote.name
end

test "Creating a new quote" do
  visit quotes_path
  assert_selector "h1", text: "Quotes"

  click_on "New Quote"
  fill_in "Name", with: "Capybara Quote"

  assert_selector "h1", text: "Quotes"
  click_on "Create Quote"

  assert_selector "h1", text: "Quotes"
  assert_text "Capybara Quote"
end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated Quote"

    assert_selector "h1", text: "Quotes"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated Quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
