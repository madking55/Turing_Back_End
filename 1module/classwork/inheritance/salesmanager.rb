require './employee'

class SalesManager < Employee
  attr_reader :base_salary, :estimated_annual_sales

  def initialize(base_salary, estimated_annual_sales)
    @base_salary = base_salary
    @estimated_annual_sales = estimated_annual_sales
  end

  def bonus
    @estimated_annual_sales * 0.1
  end
end