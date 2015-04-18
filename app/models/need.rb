class Need < ActiveRecord::Base
  has_many :student_needs
  has_many :students, :class_name => 'User', :foreign_key => :student_id
end
