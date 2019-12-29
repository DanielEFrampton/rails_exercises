class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    dog = Dog.find(params[:dog_id])
    owner = dog.owners.new(owner_params)
    if owner.save
      Ownership.create(owner: owner, dog_id: ownership_params[:dog_id], length: ownership_params[:length])
      redirect_to owners_path
    else
      render :new
    end
  end

  def adoption
    @owner = Owner.find(params[:owner_id])
    @dogs = Dog.all
  end

  def adopt
    ownership = Ownership.new(owner_id: ownership_params[:owner_id], dog_id: ownership_params[:dog_id], length: 0)
    if ownership.save
      redirect_to owners_path
    else
      render :adoption
    end
  end

  def adopt_from_list
    dogs_list[:dogs].split(', ').each do |dog_name|
      dog = Dog.where(name: dog_name).first
      ownership = Ownership.create(owner_id: ownership_params[:owner_id], dog: dog, length: 0)
    end
    redirect_to owners_path
  end

  private

    def owner_params
      params.permit(:name)
    end

    def ownership_params
      params.permit(:owner_id, :dog_id, :length)
    end

    def dogs_list
      params.permit(:dogs)
    end
end
