class AddSenderReceiverToMessage < ActiveRecord::Migration[5.1]
    def change
        add_column :messages, :user_id, :bigint
        add_column :messages, :receiver_id, :bigint
    end
end
