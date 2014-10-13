# Public: This file contains all of the functions that can be
#   used to access and modify the users table.

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Public: Display all entries in the users table.
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # Public: Display the information for single entry in the users
  #   table.
  # GET /users/1
  # GET /users/1.json
  def show
    if params[:group_id].present?
      @group = Group.find(params[:group_id])
      @user = @group.users.find(params[:id])
    end
  end
  
  # Public: Instantiate a single new user object.
  # GET /users/new
  def new
    @user = User.new
  end

  # Public: Make changes to a user object.
  # GET /users/1/edit
  def edit
  end

  # Public: Instantiate a new user object and add it to the database.
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Save all changes made to the database.
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PubliC: Remove the information for a user entry from the database.
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Internal: Create a user variable to be used by the other functions.
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Internal: enforce data access sanity.
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :firstname, :lastname, :email, :phone, :street, :aptpo, :city, :state, :zip)
    end
end
