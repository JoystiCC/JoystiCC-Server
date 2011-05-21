class TeamsController < ApplicationController
  # GET /teams/1
  # GET /teams/1.xml
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @team, :include => :players }
      format.json  { render :json => @team, :include => :players }
    end
  end

  # POST /teams
  # POST /teams.xml
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.xml  { render :xml => @team, :status => :created, :location => @team }
        format.json  { render :json => @team, :status => :created, :location => @team }
      else
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
        format.json  { render :json => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.xml
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
        format.json  { render :json => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.xml
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
