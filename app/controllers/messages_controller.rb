class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]

    # ======= filter_messages =======
    def filter_messages
        puts "\n******* filter_messages *******"
        # @users = User.all
        @users = User.where.not(:id => current_user[:id] )
        @messages = Message.where(:receiver_id => params[:receiver_id], :user_id => current_user[:id] )
        @message = @messages.first
        puts "@messages: #{@messages}"
        respond_to do |format|
            format.html { render :index }
        end
    end

    # ======= my_messages =======
    def my_messages
        puts "\n******* my_messages *******"
        @users = User.where.not(:id => current_user[:id] )
        @messages = current_user.messages
        puts "@messages: #{@messages}"
        respond_to do |format|
            format.html { render :index }
        end
    end

    # ======= new =======
    def new
        puts "\n******* new *******"
        @users = User.where.not(:id => current_user[:id] )
        @message = Message.new
    end

    # ======= create =======
    def create
        puts "\n******* create *******"
        @message = Message.new(message_params)
        @users = User.all
        @messages = current_user.messages
        puts "@messages: #{@messages}"

        respond_to do |format|
            if @message.save
                format.html { redirect_to user_message_path(current_user[:id], @message[:id]), notice: 'Message was successfully created.' }
            else
                format.html { render :my_messages }
            end
        end
    end

    # ======= index =======
    def index
        puts "\n******* index *******"
        @messages = Message.all
        # @users = User.all
        @users = User.where.not(:id => current_user[:id] )
    end

    # ======= edit =======
    def edit
        puts "\n******* edit *******"
        @users = User.where.not(:id => current_user[:id] )
    end

    # ======= update =======
    def update
        puts "\n******* update *******"
        @users = User.all
        respond_to do |format|
            if @message.update(message_params)
                format.html { redirect_to user_messages_path(current_user), notice: 'Message was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # ======= destroy =======
    def destroy
        puts "\n******* destroy *******"
        @message.destroy
            respond_to do |format|
            format.html { redirect_to user_messages(current_user), notice: 'Message was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_message
            @message = Message.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def message_params
            params.require(:message).permit(:user_id, :receiver_id, :content)
        end
end
