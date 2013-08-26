class AttendancesController < ApplicationController

  before_filter :get_report

  def create
    @attendance = @report.attendances.find_or_create_by_student_id(params[:attendance][:student_id])
    @attendance.update_attributes(status: params[:attendance][:status])
  end

  def reset
    @attendance = Attendance.find(params[:id])
  end


  private

  def get_report
    @report ||= Report.for current_user
  end

end