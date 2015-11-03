class Like < ActiveRecord::Base
    belongs_to :chef
    belongs_to :receipe
    
    validates_uniqueness_of :chef, scope: :receipe
end