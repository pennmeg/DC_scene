class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    belongs_to :primary_lang, :class_name => 'Language'
    belongs_to :secondary_lang, :class_name => 'Language'
    has_many :messages
    has_one :neighborhood
    has_one :photo
    has_one :hobby
end
