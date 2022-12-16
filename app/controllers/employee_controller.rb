class EmployeeController < ApplicationController
  before_action :employeeService
  def index
  end

  def getEmps
    @employees = employeeService.getAllUsers(params[:id])
    render json: @employees
  end

  def searchedData
    @employees = employeeService.searchedData(params[:parameter])
    render json: @employees
  end

  def totalPages
    employeeService.totalPage
  end

  def show
    @employee = employeeService.getUser(params[:id])
    @employee = JSON.parse!(@employee)
  end

  def employeeService
    Employee.new
  end
end
