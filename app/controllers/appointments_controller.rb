class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  before_action :set_doctor
  before_action :set_users, only: [:new, :create]
  def index
    @appointments = @doctor.appointments.order(:date, :time)
  end

  def show
    @user = @appointment.user.find(params[:id])
    @doctor = @appointment.doctor.find(params[:doctor_id])
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path
    else
      render :new
    end
  end

  def destroy
    @doctor.appointments.find(params[:id]).destroy
    redirect_to doctor_appointment_path(@doctor, :id)
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_users
      @users = (User.all - @doctor.users)
    end

    def appointment_params
      params.require(:appointment).permit(:user_id, :date, :time)
    end
end
