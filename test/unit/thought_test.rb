require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A Thought should have content" do
  	thought = Thought.new
  	assert !thought.save
  	assert !thought.errors[:content].empty?
  end

  test "that a thought should have atleast 10 characters" do
  	thought = Thought.new
  	thought.content = "fdaf"
  	assert !thought.save
  	assert !thought.errors[:content].empty?
  end

end
