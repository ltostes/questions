class QuestionsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @question = params[:questions]
    @answers = @question.answers
  end

end
