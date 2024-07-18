class AppointmentsController < ApplicationController
    def new
      @doctors = Doctor.all
      @appointment = Appointment.new
    end
  
    def create
      @appointment = Appointment.new(appointment_params)
  
      if @appointment.save
        redirect_to root_path, notice: 'Rendez-vous créé avec succès.'
      else
        @doctors = Doctor.all
        render :new
      end
    end
  
    private
  
    def appointment_params
      params.require(:appointment).permit(:date, :doctor_id, :patient_id)
    end
  end
  