require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   test "should not save user without name" do
     user = User.new
     assert !user.save, "Saved the user without a name"
   end

end
