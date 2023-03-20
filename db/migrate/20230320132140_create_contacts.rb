class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :sender, null: false, foreign_key: {to_table: :users}
      t.references :receiver, null: false, foreign_key: {to_table: :users}
      t.integer :status

      t.timestamps
    end
  end
end
