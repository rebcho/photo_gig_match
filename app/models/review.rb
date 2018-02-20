class Review < ApplicationRecord
  # Direct associations

  belongs_to :client

  belongs_to :photographer

  # Indirect associations

  # Validations

end
