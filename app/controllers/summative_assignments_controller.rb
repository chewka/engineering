class SummativeAssignmentsController < ApplicationController
  before_action :set_quarter
  before_action :set_lesson
  before_action :set_summative_assignment, only: %i[ show edit update destroy ]

  def index
    @summative_assignments = @lesson.summative_assignments
  end

  def show; end

  def new
    @summative_assignment = @lesson.summative_assignments.build
  end

  def create
    @summative_assignment = @lesson.summative_assignments.build(summative_assignment_params)
    if @summative_assignment.save
      redirect_to quarter_lesson_summative_assignments_path(@quarter, @lesson), notice: "Summative assignment created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @summative_assignment.update(summative_assignment_params)
      redirect_to quarter_lesson_summative_assignment_path(@quarter, @lesson, @summative_assignment), notice: "Summative assignment updated"
    else
      render :edit
    end
  end

  def destroy
    @summative_assignment.destroy
    redirect_to quarter_lesson_summative_assignments_path(@quarter, @lesson), notice: "Summative assignment deleted"
  end

  private

  def set_quarter
    @quarter = Quarter.find(params[:quarter_id])
  end

  def set_lesson
    @lesson = @quarter.lessons.find(params[:lesson_id])
  end

  def set_summative_assignment
    @summative_assignment = @lesson.summative_assignments.find(params[:id])
  end

  def summative_assignment_params
    params.require(:summative_assignment).permit(:name, :content, :points)
  end
end
