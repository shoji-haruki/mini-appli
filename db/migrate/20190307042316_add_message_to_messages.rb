class AddMessageToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :message, :string, null: false
  end
end
