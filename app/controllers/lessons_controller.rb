class LessonsController < ApplicationController
  before_action :set_quarter
  before_action :set_lesson, only: %i[ show edit update destroy ]

  def index
    @lessons = @quarter.lessons
  end

  def show; end

  def new
    @lesson = @quarter.lessons.build
  end

  def create
    @lesson = @quarter.lessons.build(lesson_params)
    if @lesson.save
      redirect_to quarter_lesson_path(@quarter, @lesson), notice: "Lesson created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @lesson.update(lesson_params)
      redirect_to quarter_lesson_path(@quarter, @lesson), notice: "Lesson updated"
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    redirect_to quarter_lessons_path(@quarter), notice: "Lesson deleted"
  end

  private

  def set_quarter
    @quarter = Quarter.find(params[:quarter_id])
  end

  def set_lesson
    @lesson = @quarter.lessons.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :lesson_number,
                                   :essential_question, :learning_intention,
                                   :content, :link,
                                   standard_ids: [])
  end
end
