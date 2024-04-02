class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :followed, foreign_keys: {to_table: :users} #seguido
      t.references :followed_by, foreign_keys: {to_table: :users} #quem segue
      t.timestamps
    end
  end
end
