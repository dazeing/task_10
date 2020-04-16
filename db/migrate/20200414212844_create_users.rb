class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.boolean :male
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
