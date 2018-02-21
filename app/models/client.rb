class Client < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :gigs,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
