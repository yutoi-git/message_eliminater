class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :myself_gender, :string
    add_column :users, :myself_age, :integer
  end
end
