class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.xml  { render :xml => @games, :include => :teams }
      format.json { render :json => @games, :include => :teams }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @game, :include => :teams }
      format.json { render :json => @game, :include => :teams }
    end
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new
    @game.name = params[:name]
    @game.owner_id = params[:owner_id]
    @game.password = params[:password]

    respond_to do |format|
      if @game.save
        format.xml  { render :xml => @game, :status => :created, :location => @game }
        format.json  { render :json => @game, :status => :created, :location => @game }
      else
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
        format.json  { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])
    @player = Player.find(params[:player_id])
    if @player.access_key == params[:access_key] && @game.owner_id == @player.id then
      @game.name = params[:name]
      @game.owner_id = params[:owner_id]
      respond_to do |format|
        if @game.save
          format.xml  { head :ok }
          format.json  { head :ok }
        else
          format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
          format.json  { render :json => @game.errors, :status => :unprocessable_entity }
        end
      end
    else
      head :unauthorized
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])

    if @player.access_key == params[:access_key] && @game.owner_id == @player.id then
      @game.destroy
      respond_to do |format|
        format.xml  { head :ok }
        format.json { head :ok }
      end
    else
      head :unauthorized
    end
  end
end
