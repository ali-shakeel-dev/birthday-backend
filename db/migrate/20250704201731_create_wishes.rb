class CreateWishes < ActiveRecord::Migration[7.2]
  def change
    create_table :wishes do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.string :time
      t.string :style
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
