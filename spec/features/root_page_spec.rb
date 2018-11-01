require 'rails_helper'

describe "Root page" do
  it "should show basic info" do
    visit '/'

    expect(page).to have_content("Welcome to NeighborHub API")
    expect(page).to have_content("Endpoints")
  end
end
