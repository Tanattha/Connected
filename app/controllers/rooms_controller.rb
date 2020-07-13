class RoomsController < ApplicationController
    
    before_action :load_room, only: [:show , :edit, :update]
    before_action :load_rooms, only: [:show]
    before_action :logged_in?
    
    def index
      @rooms = Room.all
    end
  
    def show
      @room_message = RoomMessage.new room: @room
    
      @room_messages = @room.room_messages.includes(:user)
        
    if @room_messages.length > 10
      @over_ten = true
      @room_messages = @room.room_messages.includes(:user)[-10..-1]
     end
     if params[:m]
      @room_messages = false
      @room_messages = @room.room_messages.includes(:user)
     end
      
    end
  
    def new
      @room = Room.new
    end
  
    def create
      @room = Room.new(room_params)
      if @room.save
        flash[:success] = "Room #{@room.name} created successfully"
        redirect_to rooms_path
      else
        render 'new'
      end
    end
  
    def edit; end
  
    def update
      if @room.update_attributes(room_params)
        flash[:success] = "Room #{@room.name} updated successfully"
      else
        render 'edit'
      end
    end
  
    protected
  
    def load_room
      @room = Room.find(params[:id]) if params[:id]
    end
  
    def load_rooms
      @rooms = Room.all
    end
  
    def room_params
      params.require(:room).permit(:name)
    end
  end