require 'spec_helper'

describe Avatar do
  before do 
    @avatar = Avatar.new "diogobenica"
  end

  it { @avatar.should respond_to(:twitter) }
  it { @avatar.should respond_to(:facebook) }

  describe "when request profile picture from facebook" do
    before do
    	@image = @avatar.facebook
    end

    describe "and the username exists" do
    	it { @image.class.should == String }
    end
  end
end
