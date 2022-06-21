class CreateCompanions < ActiveRecord::Migration[7.0]
  def change
    create_table :companions do |t|
      t.string :nickname
      t.string :relationship
      t.string :acquainted
      t.string :closeness
      t.string :solution
      t.string :partner_gender
      t.string :partner_age
      t.string :other
      t.references :user, null: false, foreign_key: true
      t.references :exchange, foreign_key: true

      t.timestamps
    end
  end
end
