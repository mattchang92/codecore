class AddStatusToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :status, :boolean
  end
end
