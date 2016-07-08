class Like < ActiveRecord::Base
   belongs_to :chef 
   belongs_to :recipe
   
   validates_uniqueness_of :chef,scope: :recipe
end