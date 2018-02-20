class Client < ApplicationRecord
  # Direct associations

  belongs_to :location

  has_many   :reviews,
             :dependent => :destroy

  has_many   :gigs,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
