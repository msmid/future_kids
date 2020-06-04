class SchoolsController < ApplicationController
  load_and_authorize_resource
  include CrudActions

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if @school.update(school_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def school_params
    params.require(:school).permit(
      :name, :school_kind, :principal_id, :street, :city, :phone, :homepage, :social,
      :district, :note, :term
    )
  end
end
