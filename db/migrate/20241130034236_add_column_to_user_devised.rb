class AddColumnToUserDevised < ActiveRecord::Migration[8.0]
  def change
    add_column :user_deviseds, :full_name, :string
    add_column :user_deviseds, :username, :string
    add_column :user_deviseds, :phone_number, :string
  end
end
