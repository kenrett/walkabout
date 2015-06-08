require 'spec_helper'

describe Book, :type => :model do
  before(:each) do
    @book = create(:book)
  end

  xit { is_expected.to have_many :guides }
  xit { is_expected.to validate_presence_of(:title) }
  xit { is_expected.to validate_presence_of(:price) }
  xit { is_expected.to validate_presence_of(:description) }

  context "validates" do
    it "it has a title, price, and description" do
      expect(@book).to be_valid
    end

    it "without a price is invalid" do
      @book.price = ''
      expect(@book).to be_invalid
    end

    it "without a description is invalid" do
      @book.description = ''
      expect(@book).to be_invalid
    end
  end
end
