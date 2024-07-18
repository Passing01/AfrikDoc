class Patient < ApplicationRecord
    has_many :appointments
    has_many :doctors, through: :appointments
    belongs_to :city,
    validates :first_name, :last_name, presence: true
  end