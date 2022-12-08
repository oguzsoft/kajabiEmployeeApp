class EmployeeController < ApplicationController
  before_action :employeeService

  def index

  end

  def getEmps
    @employees = employeeService.getAllUsers
    render json: @employees
  end

  def show
    @employee = employeeService.getUser(params[:id])
  end


  def employeeService
    Employee.new
  end
end
