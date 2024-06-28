class AddCountryToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :country, :string
  end
end
