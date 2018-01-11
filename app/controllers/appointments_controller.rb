class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.pet = Pet.find(params[:pet_id])

    if @appointment.save
      redirect_to pet_path(params[:pet_id])
    else
      flash[:notice] = "Appt not saved properly"
      redirect_to new_pet_appointment_path(@appointment.pet)
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:reason, :time, :veterinarian)
  end
end
