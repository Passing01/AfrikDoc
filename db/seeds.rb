# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
City.create(name: "Paris")
City.create(name: "Lyon")

Specialty.create(name: "Cardiology")
Specialty.create(name: "Dermatology")

Doctor.create(first_name: "John", last_name: "Doe", city: City.first, specialties: [Specialty.first])
Doctor.create(first_name: "Jane", last_name: "Doe", city: City.second, specialties: [Specialty.first, Specialty.second])

Patient.create(first_name: "Michael", last_name: "Smith", city: City.first)
Patient.create(first_name: "Emily", last_name: "Johnson", city: City.second)

Appointment.create(date: Time.now, doctor: Doctor.first, patient: Patient.first, city: City.first)
Appointment.create(date: Time.now + 1.day, doctor: Doctor.second, patient: Patient.second, city: City.second)
