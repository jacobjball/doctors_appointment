class AppointmentController < ApplicationController
  # before_action :set_doctor


  def index
    @appointments = Appointment
  end


  def new
    @users = User.all - @doctor.users
    @appointments = Appointment.new
  end
  def create
    @appointment = @doctor.appointments.(appointment_params)

    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to docotor_appointments_path(@doctor)
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appointment_params
      params.require(:appointment).permit(:purpose, :date, :time)
    end
end
