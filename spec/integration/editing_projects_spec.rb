
require 'spec_helper'

feature 'Editing Projects' do
  before do
    Factory(:project, name: 'TextMate 2')
    visit root_path
    click_link 'TextMate 2'
    click_link 'Edit Project'
  end

  scenario 'Updating a project' do
    fill_in "Name", with: "TextMate 2 Beta"
    click_button "Update Project"
    page.should have_content("Project has been updated.")
  end

  scenario "Updating a project with invalid attributes is bad" do
    fill_in "Name", with: ""
    click_button "Update Project"
    page.should have_content("Project has not been updated.")
  end
end
