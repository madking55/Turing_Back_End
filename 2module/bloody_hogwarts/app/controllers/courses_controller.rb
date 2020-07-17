class CoursesController < ApplicationController
  def index
    @courses = Course.alphabetical_order
  end  
end