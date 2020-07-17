class StudentsController < ApplicationController
  def index
    @students = Student.alphabetical_order
  end

  def show
    @student = Student.find(params[:id])
  end
end