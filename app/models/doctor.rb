class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    belongs_to :city
    has_and_belongs_to_many :specialties
    validates :first_name, :last_name, :specialty, :zip_code, presence: true
    validates :zip_code, length: { is: 5 }

    def self.search(query)
        where("specialty ILIKE ? OR zip_code ILIKE ?", "%#{query}%", "%#{query}%")
      end
      
  end

  
