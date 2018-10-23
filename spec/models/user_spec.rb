require 'rails_helper'

describe User, type: :model do
  it {should have_many :projects}
  it {should belong_to :project}
end
