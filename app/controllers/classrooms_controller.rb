class ClassroomsController < ApplicationController
  def index
    @classrooms = current_user.classrooms
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    
    respond_to do |format|
      if @classroom.save
        format.html {redirect_to @classroom, notice: "Classroom was successfully created."}
      else
        format.html {render 'new'}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html {redirect_to @classroom, notice: "Classroom was successfully updated."}
      else
        format.html {redirect_to @edit}
      end
    end
  end

  def destroy
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url, notice "Classroom successfully destroyed."}
    end
  end

  def show
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name, :description, :verification_code, :beginning, :end)
  end
end
