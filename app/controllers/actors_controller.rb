class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:new, :edit, :create, :update, :destroy]
  # GET /actors
  # GET /actors.json
  def index
    store_location
    @actors = Actor.all
  end

  # GET /actors/1
  # GET /actors/1.json
  def show
    @actor = Actor.find(params[:id])
  end

  # GET /actors/new
  def new
    if user_signed_in?
      @actor = Actor.new
    else
      redirect_to actors_path
    end
  end

  # GET /actors/1/edit
  def edit
    if user_signed_in?
      @actor = Actor.find(params[:id])
    else
      redirect_to actors_path
    end
  end

  # POST /actors
  # POST /actors.json
  def create
    if user_signed_in?
      @actor = Actor.new(actor_params)
      respond_to do |format|
        if @actor.save
          format.html { redirect_to @actor, notice: 'Actor was successfully created.' }
          format.json { render :show, status: :created, location: @actor }
        else
          format.html { render :new }
          format.json { render json: @actor.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to actors_path
    end
  end

  # PATCH/PUT /actors/1
  # PATCH/PUT /actors/1.json
  def update
    if user_signed_in?
      respond_to do |format|
        if @actor.update(actor_params)
          format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
          format.json { render :show, status: :ok, location: @actor }
        else
          format.html { render :edit }
          format.json { render json: @actor.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to actors_path
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    if user_signed_in?
      @actor.destroy
      respond_to do |format|
        format.html { redirect_to actors_url, notice: 'Actor was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to actors_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actor_params
      params.require(:actor).permit(:first, :last, :approved, :stage_name, :birthday) 
    end
end
