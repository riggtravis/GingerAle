# Public: The functions that access and manipulate the information
#   in the courses table.

class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # Public: Lists all courses
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # Public: Outputs the information relating to a single course.
  # GET /courses/1
  # GET /courses/1.json
  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @course = @user.courses.find(params[:id])
    end
  end

  # Public: Generates a new course, but does not add it to the
  #   database.
  # GET /courses/new
  def new
    @course = Course.new
  end

  # Public: Allows a user to change the values of an existing course.
  # GET /courses/1/edit
  def edit
  end

  # Public: Adds the information for a course to the database.
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Saves any changes made to a course to the database.
  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # Public: Removes the information for a course from the database.
  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Internal: creates a variable containing information for a course.
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Internal: Enforces sane data manipulation.
    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :term, :subject, :listing, :user_id)
    end
end
