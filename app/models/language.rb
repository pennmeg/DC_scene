class Language < ApplicationRecord
    has_many :users_as_primary_lang, :class_name => 'User', :foreign_key => 'primary_lang_id'
    has_many :users_as_secondry_lang, :class_name => 'User', :foreign_key => 'secondry_lang_id'
end
