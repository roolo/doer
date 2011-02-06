class UsersDecisionsController < ApplicationController
  # GET /users_decisions
  # GET /users_decisions.xml
  def index
    @users_decisions = UsersDecision.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users_decisions }
    end
  end

  # GET /users_decisions/1
  # GET /users_decisions/1.xml
  def show
    @users_decision = UsersDecision.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users_decision }
    end
  end

  # GET /users_decisions/new
  # GET /users_decisions/new.xml
  def new
    @users_decision = UsersDecision.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @users_decision }
    end
  end

  # GET /users_decisions/1/edit
  def edit
    @users_decision = UsersDecision.find(params[:id])
  end

  # POST /users_decisions
  # POST /users_decisions.xml
  def create
    @users_decision = UsersDecision.new(params[:users_decision])

    respond_to do |format|
      if @users_decision.save
        format.html { redirect_to(@users_decision, :notice => 'Users decision was successfully created.') }
        format.xml  { render :xml => @users_decision, :status => :created, :location => @users_decision }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @users_decision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users_decisions/1
  # PUT /users_decisions/1.xml
  def update
    @users_decision = UsersDecision.find(params[:id])

    respond_to do |format|
      if @users_decision.update_attributes(params[:users_decision])
        format.html { redirect_to(@users_decision, :notice => 'Users decision was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @users_decision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users_decisions/1
  # DELETE /users_decisions/1.xml
  def destroy
    @users_decision = UsersDecision.find(params[:id])
    @users_decision.destroy

    respond_to do |format|
      format.html { redirect_to(users_decisions_url) }
      format.xml  { head :ok }
    end
  end
end
