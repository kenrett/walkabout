require 'spec_helper'

describe Book, :type => :model do
  before(:each) do
    @guide = create(:guide)
  end

  xit { is_expected.to have_one :book }
  xit { is_expected.to validate_presence_of(:title) }
  xit { is_expected.to validate_presence_of(:price) }
  xit { is_expected.to validate_presence_of(:description) }

  context "validates" do
    it "it has a title, price, and description" do
      expect(@guide).to be_valid
    end

    it "without a price is invalid" do
      @guide.price = ''
      expect(@guide).to be_invalid
    end

    it "without a description is invalid" do
      @guide.description = ''
      expect(@guide).to be_invalid
    end
  end
end