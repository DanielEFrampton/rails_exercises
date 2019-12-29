class TricksController < ApplicationController
  def index
    @dog = Dog.find(params[:dog_id])
    @tricks = @dog.tricks
  end

  def new
    @dog = Dog.find(params[:dog_id])

  end

  def create
    dog = Dog.find(params[:dog_id])
    trick = dog.tricks.new(trick_params)
    if trick.save
      redirect_to dog_tricks_path
    else
      render :new
    end
  end

  private

    def trick_params
      params.permit(:title)
    end
end
