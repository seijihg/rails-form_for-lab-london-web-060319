class StudentsController < ApplicationController
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        student = Student.create(student_params(:first_name, :last_name))
        redirect_to student_path(student)
    end

    def show
        find_student(params[:id])
    end

    def edit
        find_student(params[:id])
    end

    def update
        find_student(params[:id])
        @student.update(student_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    private

    def find_student(id)
        @student = Student.find(id)
    end

    def student_params(*args)
        params.require(:student).permit(*args)
    end

end
