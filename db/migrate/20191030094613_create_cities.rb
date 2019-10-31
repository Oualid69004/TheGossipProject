class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :nom_ville

      t.timestamps
    end
  end
end
