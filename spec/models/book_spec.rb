require 'spec_helper'

describe Book, :type => :model do
  before(:each) do
    @book = create(:book)
  end

  it "has a title, price, and description" do
    expect(@book).to be_valid
  end

  xit "without a price is invalid" do

  end

  xit "without a description is invalid" do

  end
end