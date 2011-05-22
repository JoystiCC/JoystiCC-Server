class TeamsController < ApplicationController
  # GET /teams/1
  # GET /teams/1.xml
  def show
    @team = Team.find(params[:id])
    @team[:score] = @team.player_scores
    respond_to do |format|
      format.xml  { render :xml => @team, :include => :players }
      format.json  { render :json => @team, :include => :players }
    end
  end

  # POST /teams
  # POST /teams.xml
  def create
    @game = Game.find(params[:game_id])
    if @game.password == params[:game_password] then
      @team = Team.new
      @team.name = params[:name]
      @team.game_id = params[:game_id]
      @team.leader_id = params[:leader_id]

      respond_to do |format|
        if @team.save
          format.xml  { render :xml => @team, :status => :created, :location => @team }
          format.json  { render :json => @team, :status => :created, :location => @team }
        else
          format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
          format.json  { render :json => @team.errors, :status => :unprocessable_entity }
        end
      end
    else
      head :unauthorized
    end
  end

  # PUT /teams/1
  # PUT /teams/1.xml
  def update
    @team = Team.find(params[:id])
    @player = Player.find(params[:player_id])
    if @player.access_key == params[:access_key] && (@team.leader_id == @player.id || @team.game.owner_id == @player.id) then
      @team.name = params[:name]
      @team.leader_id = params[:leader_id]

      respond_to do |format|
        if @team.save
          format.xml  { head :ok }
          format.json  { head :ok }
        else
          format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
          format.json  { render :json => @team.errors, :status => :unprocessable_entity }
        end
      end
    else
      head :unauthorized
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.xml
  def destroy
    @team = Team.find(params[:id])
    @player = Player.find(params[:player_id])
    if @player.access_key == params[:access_key] && (@team.leader_id == @player.id || @team.game.owner_id == @player.id) then
      @team.destroy

      respond_to do |format|
        format.xml  { head :ok }
        format.json { head :ok }
      end
    else
      head :unauthorized
    end
  end
end
