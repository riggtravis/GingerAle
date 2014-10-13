# Public: This class contains all of the functions that will be
#   allowed to mannipulate and access  data in the group table.

class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # Public: Lists all entries.
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # Public: Gives the information for a single entry.
  # GET /groups/1
  # GET /groups/1.json
  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @group = @user.find(params[:id])
    else 
      if params[:course_id].present?
        @course = Course.find(params[:course_id])
        @group = @course.groups.find(params[:id])
      end
    end
  end

  # Public: Creates a new group object.
  # GET /groups/new
  def new
    @group = Group.new
  end

  # Public: Allows the user to make changes to a group object.
  # GET /groups/1/edit
  def edit
  end

  # Public: Instantiates a group object, and adds it to the database
  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Saves any changes to the database.
  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Removes a group entry from the database.
  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Internal: Creates a variable that contains the information for a group.
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Internal: Enforce data access sanity.
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:user_id, :course_id)
    end
end
