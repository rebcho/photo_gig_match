class Gig < ApplicationRecord
  # Direct associations

  belongs_to :project_type,
             :class_name => "Genre",
             :foreign_key => "genre_id"

  belongs_to :location

  belongs_to :client

  # Indirect associations

  # Validations

end
