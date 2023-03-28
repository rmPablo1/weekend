class CreateUsersGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :users_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
