class UsersDecision < ActiveRecord::Base
  belongs_to :user
  belongs_to :suggestion
  belongs_to :decision
  belongs_to :decision_status
  
end
