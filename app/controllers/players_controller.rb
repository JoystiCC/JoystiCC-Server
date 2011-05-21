class PlayersController < ApplicationController

  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @player }
      format.json  { render :json => @player }
    end
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        @player.key = @player.access_key
        format.xml  { render :xml => @player, :status => :created, :location => @player }
        format.json  { render :json => @player, :status => :created, :location => @player }
      else
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
        format.json  { render :json => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])

    if @player.access_key != params[:access_key]
      head :unauthorized
    end

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
        format.json  { render :json => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  def join_team
    @player = Player.find(params[:id])

    if @player.access_key != params[:access_key]
      head :unauthorized
    end

    @team = Team.find(params[:team_id])

    if @team.game.password == params[:game_password]
      @player.team_id = @team.id
    else
      head :unauthorized
    end

    respond_to do |format|
      if @player.save
        format.xml  { render :xml => @player }
        format.json  { render :json => @player }
      else
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
        format.json  { render :json => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])

    if @player.access_key != params[:access_key]
      head :unauthorized
    else
      @player.destroy
    end

    respond_to do |format|
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
