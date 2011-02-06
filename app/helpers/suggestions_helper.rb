module SuggestionsHelper
  def suggestion_agree_link_to suggestion_id
    link_to 'I agree', 
            url_for(
              :action => 'set_decision', 
              :suggestion_id => suggestion_id
            )+'/'+Decision.find( 
                :first, 
                :conditions => "name = 'Agree'"
              ).id.to_s,
            :remote => true
  end
end
