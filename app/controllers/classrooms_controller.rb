class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!, only: [:new_registration, :new, :create, :edit, :update, :destroy]
  
  before_action :regs_params, only: [:register]
  
  def index
    @classrooms = Array.new
    @instructors = Array.new
    current_user.registrations.each do |registration|
      @classrooms.push(registration.classroom)
      @instructors.push(registration.classroom.find_instructor)
    end
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    
    respond_to do |format|
      if @classroom.save
        Registration.create(user_id:current_user.id, classroom_id:@classroom.id, status:Classroom.instructor)
        format.html {redirect_to @classroom, notice: "Aula criada com sucesso."}
      else
        format.html {render 'new'}
      end
    end
  end

  def edit
    @instructor = @classroom.find_instructor
    if current_user.id != @instructor.id
      redirect_to @classroom
    end
  end

  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html {redirect_to @classroom, notice: "Aula atualizada com sucesso."}
      else
        format.html {redirect_to :edit}
      end
    end
  end

  def destroy
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: "Classroom successfully destroyed."}
    end
  end

  def show
    @instructor = @classroom.find_instructor
    @topics = @classroom.topics
  end

  def new_registration
    @registration = Registration.new
  end
  
  def register
    instructor = User.where(@us).first
    croom = Classroom.where(@cls).first
    
    
    respond_to do |format|
      
      if croom.nil?
        format.html {redirect_to classrooms_url, notice: "Código de aula inválido"}
      elsif instructor.nil?
        format.html {redirect_to classrooms_url, notice: "Email de professor inválido"}
      elsif !(croom.find_instructor == instructor)
        format.html {redirect_to classrooms_url, notice: "Combinação de Email e Código inválido"}
      elsif (instructor == current_user)
        format.html {redirect_to classrooms_url, notice: "Você não pode se inscrever como aluno em uma aula sua!"}
      elsif !(Registration.where(user:current_user, classroom:croom).first.nil?)
        format.html {redirect_to classrooms_url, notice: "Você já se inscreveu nesta aula!"}
      else
      Registration.create(user:current_user, classroom:croom, status:Classroom.student)
      format.html {redirect_to classrooms_url, notice: "Inscrição feita com sucesso!"}  
      end
    end
  end

  private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name, :description, :verification_code, :beginning, :end)
  end
  
  def regs_params
      @cls = params.require(:classroom).permit(:verification_code)
      @us = params.require(:user).permit(:email)
  end
end
