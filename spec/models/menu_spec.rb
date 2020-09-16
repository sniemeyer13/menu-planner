require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should have_many(:ingredients).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
end
