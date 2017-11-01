class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    belongs_to :primary_lang, :class_name => 'Language'
    belongs_to :secondary_lang, :class_name => 'Language'

    has_many :messages_as_sender, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :messages_as_receiver, :class_name => 'Message', :foreign_key => 'receiver_id'

    has_one :neighborhood
    has_one :photo
end
