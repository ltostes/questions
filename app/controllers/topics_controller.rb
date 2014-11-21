class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  
  def index
    classroom_id = params[:classroom_id]
    parent_topic_id = params[:parent_topic_id]

    unless classroom_id.nil?
      @topics = Topic.where(classroom_id: classroom_id)
    else
      @topics = Topic.where(parent_topic_id: parent_topic_id)
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    classroom_id = params[:classroom_id]
    parent_topic_id = params[:parent_topic_id]

    respond_to do |format|
      if @topic.save
        # If the new topic is in the root of the classroom
        unless classroom_id.nil?
          @topic.update(classroom_id: classroom_id, parent_topic_id: nil)
        else # The new topic is under another topic
          @topic.update(classroom_id: nil, parent_topic_id: parent_topic_id)
        end
        format.html { render @topic, notice: "Tópico criado com sucesso." }
      else
        format.html { render 'new'}
      end
    end
  end

  def edit
    classroom_id = @topic.find_root
    @instructor = Classroom.find(classroom_id).find_instructor
    
    if current_user.id != @instructor.id
      redirect_to @topic
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: "Tópico atualizado com sucesso."}
      else
        format.html { redirect_to :edit}
      end
    end
  end

  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url, notice: "Tópico excluído com sucesso."}
    end
  end

  def show
    @questions = @topic.questions
    @topics = Topic.where(parent_topic_id: @topic.id)
    flash[:topic_id] = @topic.id
    @answer = Answer.new
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
