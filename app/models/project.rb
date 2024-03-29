class Project < ActiveRecord::Base

  belongs_to :user
  has_many :tasks , :dependent => :destroy
  
  accepts_nested_attributes_for  :tasks, :allow_destroy => true 
  attr_accessible :tasks_attributes  
  attr_accessible :name
  
  validates :name, :presence   => true,
                   :length     => { :maximum => 150}

end
