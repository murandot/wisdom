class AddImageToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :image, :string
  end
end
