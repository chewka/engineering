class LessonStandardsController < ApplicationController
  before_action :set_quarter
  before_action :set_lesson

  def create
    @lesson.lesson_standards.create!(lesson_standard_params)
    redirect_to quarter_lesson_path(@quarter, @lesson), notice: "Standard added"
  end

  def destroy
    @lesson_standard = @lesson.lesson_standards.find(params[:id])
    @lesson_standard.destroy
    redirect_to quarter_lesson_path(@quarter, @lesson), notice: "Standard removed"
  end

  private

  def set_quarter
    @quarter = Quarter.find(params[:quarter_id])
  end

  def set_lesson
    @lesson = @quarter.lessons.find(params[:lesson_id])
  end

  def lesson_standard_params
    params.require(:lesson_standard).permit(:standard_code)
  end
end
