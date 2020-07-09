class RoomMessagesController < ApplicationController
    before_action :load_entities
    before_action :logged_in?
  
    def create
      @room_message =
        RoomMessage.create(
          user: current_user,
          room: @room,
          message: params.dig(:room_message, :message)
        )

         redirect_to room_path(@room.id) if @room_message
    end
  
    def destroy 
      @room_message.destroy_all
      redirect_to rooms_path
    end
    protected
  
    def load_entities
      @room = Room.find params.dig(:room_message, :room_id)
    end
  end