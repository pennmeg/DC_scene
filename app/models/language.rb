class Language < ApplicationRecord
    belongs_to :primary_lang, :class_name => 'User'
    belongs_to :secondary_lang, :class_name => 'User'
end
