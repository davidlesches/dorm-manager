class ReportsController < ApplicationController

  def show
    @report = Report.for current_user
  end

end