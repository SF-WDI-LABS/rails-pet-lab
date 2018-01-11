class PetsController < ApplicationController

  def index
    # TODO: set up data for index view
    @owner = Owner.find(params[:owner_id])
  end

  def show
    # TODO: set up data for show view
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new()
  end

  def create
    @pet = Pet.new(pet_params)

    @pet.owner_id = params[:owner_id]

    if @pet.save
      redirect_to owner_pets_path(params[:owner_id])
    else
      flash[:notice] = @pet.errors.full_messages
      redirect_to new_owner_pet_path(params[:owner_id])
    end
  end

  # TODO: set up *new* method with data for new view

  # TODO: set up *create* method with database interactions for create
  # TODO: handle save errors and communicate issues to user

  private
  def pet_params
    params.require(:pet).permit(:name, :breed)
  end

end
