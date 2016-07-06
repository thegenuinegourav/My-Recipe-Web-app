require 'test_helper'

class ChefTest < ActiveSupport::TestCase
   
   def setup
       @chef = Chef.new(chefname: "Bob", email: "bob@example.com")
   end 
   
   test "chef should be valid" do
       assert @chef.valid?
   end
   
   test "chefname must be present" do
       @chef.chefname = " "
       assert_not @chef.valid?
   end
   
   test "chefname should not be too short" do
       @chef.chefname = "aa"
       assert_not @chef.valid?
   end
   
   test "chefname must not be too long" do
       @chef.chefname = "a" * 41
       assert_not @chef.valid?
   end
   
   test "email must be present" do
       @chef.email = " "
       assert_not @chef.valid?
   end
   
   test "email should be unique" do
       dup_chef = @chef.dup
       dup_chef.email = @chef.email.upcase
       @chef.save
       assert_not dup_chef.valid?
   end
   
   test "email validation should accept valid email addresses" do
       valid_addresses = %w[bob@example.com suri.bob@example.com bob@example.org.com]
       valid_addresses.each do |va|
           @chef.email = va
           assert @chef.valid?
       end
   end
   
   test "email validation should not accept invalid email addresses" do
       invalid_addresses = %w[bob@example? @exmaple.com bob bob@exa+mple.com]
       invalid_addresses.each do |ia|
           @chef.email = ia
           assert_not @chef.valid?
       end
   end
end