class InstructorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

  def index
    render json: Instructor.all, status: :ok
  end

  def show
    instructor = find_instructor
    render json: instructor, status: :ok
  end

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = find_instructor
    instructor.update!(instructor_params)
    render json: instructor, status: :created
  end

  def destroy
    instructor = find_instructor
    instructor.destroy
    head :no_content
  end

  private

  def find_instructor
    Instructor.find(params[:id])
  end

  def instructor_params
    params.permit(:name)
  end

  def render_record_not_found_response
    render json: { error: "Instructor not found" }, status: :not_found
  end
end
