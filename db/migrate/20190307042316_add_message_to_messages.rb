class AddMessageToMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :message, null: false
      t.references :user
      t.timestamps null: false
    end
  end
end
