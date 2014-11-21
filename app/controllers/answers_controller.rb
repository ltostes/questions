class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def new
    @answer = Answer.new
  end

  def create
    respond_to do |format|
      @answer = Answer.new(answer_params)
      if @answer.save
        @answer.update(rank: 0, status:Answer.normal)
        format.html { redirect_to @answer.question.topic }
      else
        format.html { redirect_to @answer.question.topic, notice: "Resposta não foi criada" }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer.question, notice: "Resposta atualizada com sucesso."}
      else
        format.html { redirect_to :edit}
      end
    end
  end

  def destroy
  end

  def show
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end

end
