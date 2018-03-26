require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit questions_url
  #
  #   assert_selector "h1", text: "Questions"
  # end
  test "visting /ask renders the form" do
    visit ask_url
    assert_selector "h1", text: "What do you want to ask to your coach?"
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "ASK!"

    assert_text "I don't care, get dressed and go to work!"
  end

  test "saying something with '?' gets a silly response from the coach" do
    visit ask_url
    fill_in "question", with: "what do you want to do?"
    click_on "ASK!"

    assert_text "Silly question, get dressed and go to work!"
  end

  test "saying you are going to work gets a good response from the coach" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "ASK!"

    assert_text "Great!"
  end
end
