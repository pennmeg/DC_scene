class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :languages_as_primary_lang, :class_name => 'Language', :foreign_key => 'primary_lang_id'
    has_many :languages_as_secondry_lang, :class_name => 'Language', :foreign_key => 'secondry_lang_id'

    has_many :messages_as_sender, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :messages_as_receiver, :class_name => 'Message', :foreign_key => 'receiver_id'

    has_one :neighborhood
    has_one :photo
end
