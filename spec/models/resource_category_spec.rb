require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    
      it "exists" do
     ResourceCategory.new
      end
    
      it "has a name" do
     resource_category = ResourceCategory.new
     expect(resource_category).to respond_to(:name)
      end
    
      it "has a string representation that is its name" do
     name = 'Camping'
     resource_category = ResourceCategory.new(name: name)
     result = resource_category.to_s
      end
    

end
