class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    topic_id = params[:topic_id]
    @questions = Question.where(topic_id: topic_id).order(rank: :desc)
  end

  def new
    @question = Question.new
    @topic = Topic.find(flash[:topic_id])
    flash[:topic_id] = @topic.id
  end

  def create
    respond_to do |format|
      @question = Question.new(question_params)
      if @question.save
        @question.update(topic_id: flash[:topic_id], status: Question.open, rank: 0) 
        Subscription.create(status: Subscription.author, question_id: @question.id, user_id: current_user.id)
        format.html { redirect_to @question.topic, notice: "Pergunta feita com sucesso." }
      else
        format.html { render 'new' }
      end
    end
  end

  def edit
    @user = question.find_author
    if current_user.id != @user.id
      redirect_to @question
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html {redirect_to @question, notice: "Pergunta atualizada com sucesso."}
      else
        format.html {redirect_to :edit}
      end
    end
  end

  def destroy
    # Clean up dependent tables
    @question.answers.each do |answer|
      answer.destroy
    end
    
    @question.subscriptions.each do |subscription|
      subscription.destroy
    end
    # All cleaned up, now destroy the question
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questionss_url, notice: "Pergunta removida com sucesso"}
    end
  end

  def show
    @answers = @question.answers.order(rank: :desc)
    flash[:question_id] = @question.id
  end
 
  def rank_up
    @question = Question.find(params[:question_id])
    case current_user.id
    # user is the author of the question
    when @question.find_author.id
      case @question.status
      when Question.open
        @question.update(status: Question.author_approved)
      when Question.instructor_approved
        @question.update(status: Question.both_approved)
      else
      end
    # User is the instructor
    when @question.topic.find_root.find_instructor
      case @question.status
      when Question.open
        @question.update(status: Question.instructoror_approved)
      when Question.author_approved
        @question.update(status: Question.both_approved)
      else
      end
    # User is someone else
    else
      @question.update(rank: :rank+1)
    end
    redirect_to @question
  end

  def rank_down
    case current_user.id
    # User is the instructor
    when @question.topic.find_root.find_instructor
      case @question.status
      when Question.open
        @question.update(status: Question.instructoror_approved)
      when Question.author_approved
        @question.update(status: Question.both_approved)
      else
      end
    # User is someone else
    else
      @question.update(rank: :rank - 1)
    end
    render @question
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
