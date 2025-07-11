class FormativeAssignmentsController < ApplicationController
  before_action :set_quarter
  before_action :set_lesson
  before_action :set_formative_assignment, only: %i[ show edit update destroy ]

  def index
    @formative_assignments = @lesson.formative_assignments
  end

  def show; end

  def new
    @formative_assignment = @lesson.formative_assignments.build
  end

  def create
    @formative_assignment = @lesson.formative_assignments.build(formative_assignment_params)
    if @formative_assignment.save
      redirect_to quarter_lesson_formative_assignments_path(@quarter, @lesson), notice: "Formative assignment created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @formative_assignment.update(formative_assignment_params)
      redirect_to quarter_lesson_formative_assignment_path(@quarter, @lesson, @formative_assignment), notice: "Formative assignment updated"
    else
      render :edit
    end
  end

  def destroy
    @formative_assignment.destroy
    redirect_to quarter_lesson_formative_assignments_path(@quarter, @lesson), notice: "Formative assignment deleted"
  end

  private

  def set_quarter
    @quarter = Quarter.find(params[:quarter_id])
  end

  def set_lesson
    @lesson = @quarter.lessons.find(params[:lesson_id])
  end

  def set_formative_assignment
    @formative_assignment = @lesson.formative_assignments.find(params[:id])
  end

  def formative_assignment_params
    params.require(:formative_assignment).permit(:name, :content, :points)
  end
end
