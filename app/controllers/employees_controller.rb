class EmployeesController < ApplicationController
    def create
        @employee = Employee.create(employee_params)
        @employee.company = Company.find(params[:company_id])
        @employee.save

        redirect_to @employee.company
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to @employee.company
    end    

    private 
    def employee_params
        params.require(:employee).permit(:first_name :last_name :email :area_id)
    end

end