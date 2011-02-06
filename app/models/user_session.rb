class UserSession < Authlogic::Session::Base
  include ActiveModel::Conversion 
  def persisted? 
    false 
  end 

  # configuration here, see documentation for sub modules of Authlogic::Session
end
