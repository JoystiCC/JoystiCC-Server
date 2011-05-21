class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.xml  { render :xml => @games }
      format.json { render :json => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @game }
      format.json { render :json => @game }
    end
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

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

    if @game.password != params[:game_password]
      head :unauthorized
    end

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
        format.json  { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])

    if @game.password != params[:game_password]
      head :unauthorized
    else
      @game.destroy
    end

    respond_to do |format|
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
