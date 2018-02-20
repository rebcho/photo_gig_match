class Location < ApplicationRecord
  # Direct associations

  has_many   :gigs,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
