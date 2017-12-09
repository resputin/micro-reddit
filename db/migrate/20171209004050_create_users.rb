class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    enable_extension "pgcrypto"
    create_table :users do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
