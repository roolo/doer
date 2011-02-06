class Suggestion < ActiveRecord::Base
  belongs_to  :user
  has_many :users_decisions
  has_many :decisions, :through => :users_decisions
  
  def to_s
    self.name
  end
  
  def to_url_param
    self.name.downcase.gsub(/[^\w]/, '-')
  end
end
