class AddStreetToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :street, :string
  end
end
