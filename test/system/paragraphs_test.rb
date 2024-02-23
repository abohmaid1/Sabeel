require "application_system_test_case"

class ParagraphsTest < ApplicationSystemTestCase
  setup do
    @paragraph = paragraphs(:one)
  end

  test "visiting the index" do
    visit paragraphs_url
    assert_selector "h1", text: "Paragraphs"
  end

  test "should create paragraph" do
    visit paragraphs_url
    click_on "New paragraph"

    fill_in "Content", with: @paragraph.content
    fill_in "Type", with: @paragraph.type
    fill_in "Writer", with: @paragraph.writer_id
    click_on "Create Paragraph"

    assert_text "Paragraph was successfully created"
    click_on "Back"
  end

  test "should update Paragraph" do
    visit paragraph_url(@paragraph)
    click_on "Edit this paragraph", match: :first

    fill_in "Content", with: @paragraph.content
    fill_in "Type", with: @paragraph.type
    fill_in "Writer", with: @paragraph.writer_id
    click_on "Update Paragraph"

    assert_text "Paragraph was successfully updated"
    click_on "Back"
  end

  test "should destroy Paragraph" do
    visit paragraph_url(@paragraph)
    click_on "Destroy this paragraph", match: :first

    assert_text "Paragraph was successfully destroyed"
  end
end
