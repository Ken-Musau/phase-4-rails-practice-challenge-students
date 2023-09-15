class StudentsController < ApplicationController
  def index
    render json: Student.all
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end

  def create
  end

  def destroy
  end
end
