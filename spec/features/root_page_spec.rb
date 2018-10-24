require 'rails_helper'

describe "Root page" do
  it "should show basic info" do
    visit '/'

    expect(page).to have_content("Welcome to Neighborhood")
    expect(page).to have_content("Endpoints:")
  end
end
