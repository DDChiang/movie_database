class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update]
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user_or_same_user, only: [:edit, :update, :destroy ]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    session[:root_visited] = "R"
    @rating = Rating.find(params[:id])
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_back_or(movies_path) }
        format.js
        #format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating = Rating.where('id' => params[:id]).first
    @movie = Movie.find(@rating.movie_id)
    @user = User.find(@rating.user_id)
    if @rating != nil 
      @rating.destroy
    end
    respond_to do |format|
      format.html { if session[:root_visited] == 'U'
			redirect_to @user
                    else
			redirect_to @movie
		    end
		  }
      #format.json { head :no_content }
      format.js
    end
  end

  private
    def is_admin_or_same_user
        current_user == @rating.user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:user_id, :movie_id, :review, :stars, :review_present)
    end
end
