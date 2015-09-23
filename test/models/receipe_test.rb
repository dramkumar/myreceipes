require 'test_helper'

class ReceipeTest < ActiveSupport::TestCase
    def setup
        @receipe = Receipe.new(name: "Pasta",
                               summary: "this is a Pasta receipe",
                               description: "Add veggies, Add Pasta, Boil everything,")
    end
    
    test 'Receipe should be valid' do
        assert @receipe.valid?
    end
   
    test 'Name should be present' do
        @receipe.name = ""
        assert_not @receipe.valid?
    end
    
    test 'Name length should not be too long' do
        @receipe.name = "a" * 101
        assert_not @receipe.valid?
    end
    
    test 'Name length should not be too short' do
        @receipe.name = "aaaa"
        assert_not @receipe.valid?
    end
    
    test 'Summary must be present' do
        @receipe.summary = ""
        assert_not @receipe.valid?
    end

    test 'Summary length should not be too long' do
        @receipe.summary = "a" * 151
        assert_not @receipe.valid?
    end
    
    test 'Summary length should not be too short' do
        @receipe.summary = "a" * 9
        assert_not @receipe.valid?
    end

     test 'Description must be present' do
        @receipe.description = ""
        assert_not @receipe.valid?
    end

    test 'Description length should not be too long' do
        @receipe.description = "a" * 501
        assert_not @receipe.valid?
    end
    
    test 'Description length should not be too short' do
        @receipe.description = "a" * 19
        assert_not @receipe.valid?
    end
    
end