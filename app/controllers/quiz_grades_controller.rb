class QuizGradesController < ApplicationController
  before_action :set_quarter
  before_action :set_lesson
  before_action :set_quiz
  before_action :set_quiz_grade, only: %i[ update destroy ]

  def create
    @quiz_grade = @quiz.quiz_grades.build(quiz_grade_params)
    if @quiz_grade.save
      redirect_to quarter_lesson_quiz_path(@quarter, @lesson, @quiz), notice: "Grade recorded"
    else
      redirect_to quarter_lesson_quiz_path(@quarter, @lesson, @quiz), alert: "Error recording grade"
    end
  end

  def update
    if @quiz_grade.update(quiz_grade_params)
      redirect_to quarter_lesson_quiz_path(@quarter, @lesson, @quiz), notice: "Grade updated"
    else
      redirect_to quarter_lesson_quiz_path(@quarter, @lesson, @quiz), alert: "Error updating grade"
    end
  end

  def destroy
    @quiz_grade.destroy
    redirect_to quarter_lesson_quiz_path(@quarter, @lesson, @quiz), notice: "Grade deleted"
  end

  private

  def set_quarter
    @quarter = Quarter.find(params[:quarter_id])
  end

  def set_lesson
    @lesson = @quarter.lessons.find(params[:lesson_id])
  end

  def set_quiz
    @quiz = @lesson.quizzes.find(params[:quiz_id])
  end

  def set_quiz_grade
    @quiz_grade = @quiz.quiz_grades.find(params[:id])
  end

  def quiz_grade_params
    params.require(:quiz_grade).permit(:user_id, :score)
  end
end
