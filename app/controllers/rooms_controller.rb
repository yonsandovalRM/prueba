class RoomsController < ApplicationController
  def index
  	#obtiene todas las salas de cine
  	@rooms = Room.all()
  	# Responder como
  	respond_to do |format|
	    format.html { render :index }
    end
  end

  def new
  	#Instancia @room como nueva Sala de cine
  	@room = Room.new

  	# Responder como
  	respond_to do |format|
	    format.html { render :new }
    end
  end

  def show
    @room = Room.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @room = Room.find(params[:id])
    @seat = Seat.new
    respond_to do |format|
      format.html
    end
  end


  def create
    #crea la nueva sala con los parametros del request permitidos
    @room = Room.new(room_params)

    # Responder como
    respond_to do |format|
      if @room.save #si guardo ok
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
      else #si no guardo
        format.html { render :new }
      end
    end
  end
  
  private
    #parametros fuertes permitidos
    def room_params
      params.require(:room).permit(:name, :description)
    end
end
