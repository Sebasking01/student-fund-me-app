class User < ActiveRecord::Base
  has_many :skills
  has_many :student_sponsors
  has_many :sponsors, :class_name => 'User', :foreign_key => :sponsor_id
  has_many :students, :class_name => 'User', :foreign_key => :student_id
  has_many :student_needs
  has_many :needs, through: :student_needs

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.email = auth["info"]["email"]
    end
  end

  def student?
    self.status.downcase == 'student'
  end
end
