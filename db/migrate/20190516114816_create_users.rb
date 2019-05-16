class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.integer :sex, null: false
      t.integer :birth, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
