class Task < ActiveRecord::Base
  
  belongs_to :project
  
  validates :name, :presence   => true
  
  attr_accessible :name, :time_end, :project_id, :prioritise, :is_done

end
