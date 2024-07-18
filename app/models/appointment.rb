class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :city
  validates :date, presence: true
  validate :date_cannot_be_in_past

  private

  def date_cannot_be_in_past
    if date.present? && date < Date.today
      errors.add(:date, "ne peut pas être dans le passé")
    end
  end

  def self.available_appointments(doctor_id, date)
    where(doctor_id: doctor_id, date: date).where.not(id: Appointment.joins(:patient).where(patient_id: Patient.pluck(:id)).pluck(:id))
  end
  
end