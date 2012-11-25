
require 'spec_helper'

feature "Deleting Projects" do
  scenario "Deleting a project" do
    Factory(:project, name: "TextMate 2")
    visit root_path
    click_link "TextMate 2"
    click_link "Delete Project"
    page.should have_content("Project has been deleted.")

    visit root_path
    page.should_not have_content("TextMate 2")
  end
end
