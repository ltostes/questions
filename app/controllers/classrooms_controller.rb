class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  
  def index
    #@classrooms = Classroom.all
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
        format.html {redirect_to @edit}
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
  end

  private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name, :description, :verification_code, :beginning, :end)
  end
end
