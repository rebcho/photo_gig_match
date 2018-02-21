class Application < ApplicationRecord
  # Direct associations

  belongs_to :gig

  belongs_to :photographer

  # Indirect associations

  has_one    :client,
             :through => :gig,
             :source => :client

  # Validations

end
