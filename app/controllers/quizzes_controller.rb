class QuizzesController < ApplicationController
  before_action :set_quarter
  before_action :set_lesson
  before_action :set_quiz, only: %i[ show edit update destroy ]

  def index
    @quizzes = @lesson.quizzes
  end

  def show; end

  def new
    @quiz = @lesson.quizzes.build
  end

  def create
    @quiz = @lesson.quizzes.build(quiz_params)
    if @quiz.save
      redirect_to quarter_lesson_quizzes_path(@quarter, @lesson), notice: "Quiz created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @quiz.update(quiz_params)
      redirect_to quarter_lesson_quiz_path(@quarter, @lesson, @quiz), notice: "Quiz updated"
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quarter_lesson_quizzes_path(@quarter, @lesson), notice: "Quiz deleted"
  end

  private

  def set_quarter
    @quarter = Quarter.find(params[:quarter_id])
  end

  def set_lesson
    @lesson = @quarter.lessons.find(params[:lesson_id])
  end

  def set_quiz
    @quiz = @lesson.quizzes.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
