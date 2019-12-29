class Owner < ApplicationRecord
  has_many :ownerships
  has_many :dogs, through: :ownerships

  def self.all_dog_names
    joins(:dogs).pluck('dogs.name')
  end

  def self.unique_dog_names
    joins(:dogs)
    .select('dogs.name')
    .distinct
    .order('dogs.name DESC')
    .pluck('dogs.name')
  end
end
