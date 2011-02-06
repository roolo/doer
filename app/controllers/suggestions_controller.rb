class SuggestionsController < ApplicationController
  before_filter :require_user

  # GET /suggestions
  # GET /suggestions.xml
  def index
    @suggestions = Suggestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suggestions }
    end
  end

  # GET /suggestions/1
  # GET /suggestions/1.xml
  def show
    @suggestion = Suggestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @suggestion }
    end
  end

  # GET /suggestions/new
  # GET /suggestions/new.xml
  def new
    @suggestion = Suggestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @suggestion }
    end
  end

  # GET /suggestions/1/edit
  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  # POST /suggestions
  # POST /suggestions.xml
  def create
    @suggestion = Suggestion.new(params[:suggestion])
    @suggestion.user_id = current_user.id
    
    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to(@suggestion, :notice => 'Suggestion was successfully created.') }
        format.xml  { render :xml => @suggestion, :status => :created, :location => @suggestion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @suggestion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suggestions/1
  # PUT /suggestions/1.xml
  def update
    @suggestion = Suggestion.find(params[:id])

    respond_to do |format|
      if @suggestion.update_attributes(params[:suggestion])
        format.html { redirect_to(@suggestion, :notice => 'Suggestion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @suggestion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.xml
  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy

    respond_to do |format|
      format.html { redirect_to(suggestions_url) }
      format.xml  { head :ok }
    end
  end
  
  def set_decision
    decision = UsersDecision.find :first,
                                  :conditions => [
                                    "    user_id = ?
                                     AND suggestion_id = ?
                                    ",
                                    current_user,
                                    params[:suggestion_id]
                                  ]
    if decision.nil?
      decision = UsersDecision.new :suggestion_id => params[:suggestion_id],
                                   :user_id => current_user.id,
                                   :decision_id => params[:decision_id]
      decision.save
    else
      decision.decision_id = params[:decision_id]
      decision.save
    end
    
    respond_to do |format|
      format.js{ render :nothing => true }
    end
  end
  
  def set_decision_status
    decision = UsersDecision.find :first,
                                  :conditions => [
                                    "    user_id = ?
                                     AND suggestion_id = ?
                                    ",
                                    current_user,
                                    params[:suggestion_id]
                                  ]
    if decision.nil?
      decision = UsersDecision.new :suggestion_id => params[:suggestion_id],
                                   :user_id => current_user.id,
                                   :decision_status_id => params[:decision_status_id]
      decision.save
    else
      decision.decision_status_id = params[:decision_status_id]
      decision.save
    end
    
    respond_to do |format|
      format.js{ render :nothing => true }
    end
  end
  
  def news_from
    @now = Time.now
    @last_update_stamp = params[:last_update_stamp]
    @last_update_time = Time.at(params[:last_update_stamp].to_i)
    
    participants = UsersDecision.find   :all,
                                        :conditions => [
                                          "
                                            suggestion_id = ?
                                            AND updated_at > ?
                                          ",
                                          params[:suggestion_id],
                                          @last_update_time,
                                        ]
    @participants = participants.group_by{|decision|
      if decision.created_at == decision.updated_at
        :new
      else
        :updated
      end
    }
    
    @new_suggestions = Suggestion.find(
        :all,
        :conditions => [
          "created_at > ?",
          @last_update_time,
        ]
      )
    
    respond_to do |format|
      format.html{ render :layout => 'plain'}
      format.js
    end
  end
  
  def new_suggestions_since
    @new_suggestions = Suggestion.find(
        :all,
        :conditions => [
          "created_at > ?",
          Time.at(params[:last_update_stamp].to_i),
        ]
      )
    
    render :layout => 'plain'
  end
end
