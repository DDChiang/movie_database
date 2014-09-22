class SpoilersController < ApplicationController
  before_action :set_spoiler, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:new, :edit, :create, :update, :destroy]
  # GET /spoilers
  # GET /spoilers.json
  def actual_id
    args = params[:id].split('-')
    args[0]
  end


#    view_context.link_to("undo", revert_version_path(@product.previous_version), :method => :post)

  def index
    @spoilers = Spoiler.all
  end

  # GET /spoilers/1
  # GET /spoilers/1.json
  def show
  end

  # GET /spoilers/new
  def new
    @spoiler = Spoiler.new
  end

  # GET /spoilers/1/edit
  def edit
  end

  # POST /spoilers
  # POST /spoilers.json
  def create
    @spoiler = Spoiler.new(spoiler_params)

    respond_to do |format|
      if @spoiler.save
        format.html { redirect_to @spoiler, notice: "Spoiler was successfully created. #{undo_link}" }
        format.json { render :show, status: :created, location: @spoiler }
      else
        format.html { render :new }
        format.json { render json: @spoiler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spoilers/1
  # PATCH/PUT /spoilers/1.json
  def update
    #added
    @spoiler = Spoiler.find(params[:id])
    respond_to do |format|
      if @spoiler.update(spoiler_params)
        #added
        format.html { redirect_to @spoiler, notice: "Spoiler was successfully updated. #{undo_link}" }
        format.json { render :show, status: :ok, location: @spoiler }
      else
        format.html { render :edit }
        format.json { render json: @spoiler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spoilers/1
  # DELETE /spoilers/1.json
  def destroy
    @spoiler = Spoiler.find(actual_id)
    @spoiler.destroy
    respond_to do |format|
      format.html { redirect_to spoilers_url, notice: "Spoiler was successfully destroyed. #{undo_link}" }
      format.json { head :no_content }
    end
  end

  private
  def undo_link
    view_context.link_to("undo", revert_version_path(@spoiler.versions.last), :method => :post)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_spoiler
      @spoiler = Spoiler.find(actual_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spoiler_params
      params.require(:spoiler).permit(:movie_id, :user_id, :synopsis)
    end
end
