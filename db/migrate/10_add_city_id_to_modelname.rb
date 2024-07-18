class AddCityIdToModelname < ActiveRecord::Migration[7.1]
  def change
    add_column :modelnames, :city_id, :integer
  end
end
