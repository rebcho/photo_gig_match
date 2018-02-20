class Location < ApplicationRecord
  # Direct associations

  has_many   :photographers,
             :dependent => :destroy

  has_many   :clients,
             :dependent => :destroy

  has_many   :gigs,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
