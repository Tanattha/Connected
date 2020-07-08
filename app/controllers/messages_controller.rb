class MessagesController < ApplicationController
    before_action do
     @conversation = Conversation.find(params[:conversation_id])
    end
    
  def index
    @conversations = Conversation.all
    @recipient = User.find_by_id(@conversation.recipient_id)
    @messages = @conversation.messages
   
    if @messages.length > 10
     @over_ten = true
     @messages = @messages[-10..-1]
    end
    if params[:m]
     @over_ten = false
     @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
     @messages.each do |msg|
      msg.update(read: true)
     end
    end
  end
  @message = @conversation.messages.new
   end

  def new
   @message = @conversation.messages.new
  end

  def create
   @message = @conversation.messages.new(message_params)
   if @message.save
    redirect_to conversation_messages_path(@conversation)
   end
  end

  private
   def message_params
    params.require(:message).permit(:body, :user_id)
   end
  end
