class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content

      t.timestamps
    end
    add_column :messages, :chatroom_id, :integer
    add_index  :messages, :chatroom_id
  end
end
