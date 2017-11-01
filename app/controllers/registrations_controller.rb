class RegistrationsController < Devise::RegistrationsController
    private
    def sign_up_params
        puts "******* sign_up_params *******"
        params.require(:user).permit(:firstname, :lastname, :username, :email, :password,
			:password_confirmation)
    end
    def account_update_params
        puts "******* account_update_params *******"
        params.require(:user).permit(:firstname, :lastname, :username, :email, :password,
			:password_confirmation, :current_password)
    end
end

# t.bigint "primary_lang_id"
# t.bigint "secondary_lang_id"
# t.bigint "sender_id"
# t.bigint "receiver_id"
# t.string "fullname"
# t.string "username"
# t.string "password"
# t.integer "age"
# t.string "gender"
# t.string "country"
# t.string "us_state"
# t.text "bio"
# t.boolean "admin"
