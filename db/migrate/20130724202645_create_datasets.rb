class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :nombre
      t.string :etiqueta_1
      t.string :etiqueta_2
      t.text :datos_1
      t.text :datos_2

      t.timestamps
    end
  end
end
