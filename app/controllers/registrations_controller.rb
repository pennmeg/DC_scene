class RegistrationsController < Devise::RegistrationsController
    before_action :get_languages

    def get_languages
        @languages = Language.all
    end

    private
        def sign_up_params
            puts "******* sign_up_params *******"
            params.require(:user).permit(:primary_lang_id, :secondary_lang_id, :sender_id, :receiver_id, :fullname, :username, :password, :email, :age, :gender, :country, :us_state, :bio, :admin, :password_confirmation)
        end
        def account_update_params
            puts "******* account_update_params *******"
            params.require(:user).permit(:primary_lang_id, :secondary_lang_id, :sender_id, :receiver_id, :fullname, :username, :password, :email, :age, :gender, :country, :us_state, :bio, :admin, :password_confirmation, :current_password)
        end
end

# :primary_lang_id, :secondary_lang_id, :sender_id, :receiver_id, :fullname, :username, :password, :age, :gender, :country, :us_state, :bio, :admin

# primary_lang_id
# secondary_lang_id
# sender_id
# receiver_id
# fullname
# username
# password
# email
# age
# gender
# country
# us_state
# bio
# admin
