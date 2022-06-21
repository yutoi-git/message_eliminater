class AddReferencesToExchanges < ActiveRecord::Migration[7.0]
  def change
    add_reference :exchanges, :companion, foreign_key: true
  end
end
