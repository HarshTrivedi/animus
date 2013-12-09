require 'test_helper'

class SapienTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a sapien should enter a agnomen also called nickname" do
  	sapien = Sapien.new
  	assert !sapien.save
  	assert !sapien.errors[:agnomen].empty?
  end

  test "a sapien should enter an email " do
  	sapien = Sapien.new
  	assert !sapien.save
  	assert !sapien.errors[:email].empty?
  end

  test "a sapien should enter an unique agnomen " do
  	sapien = Sapien.new
  	sapien.agnomen = sapiens(:shubham).agnomen 
  	assert !sapien.save
  	assert !sapien.errors[:agnomen].empty?
  end

  test "an agnomen should be correctly formatted" do
  	sapien = Sapien.new
  	sapien.agnomen = "See There are Spaces, and &*^%%#" 
  	assert !sapien.save
  	assert !sapien.errors[:agnomen].empty?
  	assert sapien.errors[:agnomen].include?("Must be formatted correctly.")
  end

  test "sapien with valid agnomen should be able to sign up" do
    sapien = sapiens(:shubham)
    sapien.agnomen = "a"
    assert sapien.save
  end
end
