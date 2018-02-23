class Gig < ApplicationRecord
  mount_uploader :sample_images, SampleImageUploader

  # Direct associations

  belongs_to :project_type,
             :class_name => "Genre",
             :foreign_key => "genre_id"

  has_many   :applications,
             :dependent => :destroy

  belongs_to :client

  # Indirect associations

  # Validations

end
