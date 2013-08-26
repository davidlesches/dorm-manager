class Admin::StudentsController < Admin::ApplicationController
  inherit_resources

  def index
    @students = Student.joins(:room).order('rooms.name asc, students.name asc')
  end

  def create
    create! { admin_students_path }
  end

  def update
    update! { admin_students_path }
  end

end