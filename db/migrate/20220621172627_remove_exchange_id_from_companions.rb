class RemoveExchangeIdFromCompanions < ActiveRecord::Migration[7.0]
  def change
    remove_column :companions, :exchange_id, :references
  end
end
