class RenameColumnUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :hash_password, :password_digest
  end
end
