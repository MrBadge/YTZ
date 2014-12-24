class TestUtzQuestionsController < ApplicationController
  def new
  end

  def create
    question = TestUtzQuestion.create text: params['question']

    answers = params['answers']

    answers.each_value do |answer|
      TestUtzAnswer.create text: answer['text'], is_correct: answer['correct'].to_bool, test_utz_question_id: question.id
    end

    render nothing: true
  end

  def show
    @question = TestUtzQuestion.find params[:id]
  end

  def destroy
    TestUtzQuestion.find(params[:id]).destroy
    redirect_to root_path
  end
end
