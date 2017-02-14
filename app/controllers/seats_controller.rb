class SeatsController < ApplicationController

  def edit
    @seat = Seat.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def show
    @seat = Seat.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end


  def create
    #creo los nuevos asientos para la sala con los parametros del request permitidos

    @seat = Seat.new(seat_params)
    raise @seat.to_yaml
    # Responder como
    respond_to do |format|
      if @seat.save #si guardo ok
        format.html { redirect_to @seat, notice: 'seat was successfully created.' }
      else #si no guardo
        format.html { render :new }
      end
    end
  end
  
  private
    #parametros fuertes permitidos
    def seat_params
      params.require(:seat).permit(:name=>[:name], :typed=>[:typed], :room_id=>[:room_id])
    end
end
