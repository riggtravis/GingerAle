class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # Public: List all rating entries.
  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # Public: Show the information for a single rating entry.
  # GET /ratings/1
  # GET /ratings/1.json
  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @rating = @user.ratings.find(params[:id])
    else
      if params[:group_id].present?
        @group = Group.find(params[:group_id])
        @rating = @group.ratings.find(params[:id])
      end
    end
  end

  # Public: Instantiate a new rating object.
  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # Public: Make changes to an existing rating object.
  # GET /ratings/1/edit
  def edit
  end

  # Public: Instantiate a new rating object and add it to the database.
  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rating }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Save all changes made to the database.
  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Remove a single rating object from the database.
  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :no_content }
    end
  end

  private
    # Internal: Create a rating variable to be used by other functions.
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Internal: Enforce data access sanity.
    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:numeric_rating, :comments, :date, :user_id, :group_id)
    end
end
