class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :age
      t.string :gender
      t.date :birthday
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
