class DecisionStatus < ActiveRecord::Base
  has_many  :users_decisions
  
  def to_s
    self.name
  end
end
