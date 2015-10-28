class AddUserToLinks < ActiveRecord::Migration
  def change
    rename_column :links, :account_id, :user_id
  end
end
