class RemoveUserFromNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    remove_reference :neighborhoods, :user, foreign_key: true
  end
end
