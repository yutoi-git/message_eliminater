class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :exchange, null: false, foreign_key: true
      t.text :body
      t.integer :sender, null: false
      t.datetime :datetime
      t.integer :read

      t.timestamps
    end
  end
end
