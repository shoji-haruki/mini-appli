class RemoveMessageFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :message, :string
  end
end
