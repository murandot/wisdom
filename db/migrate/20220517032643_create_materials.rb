class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string     :title,              null: false
      t.text       :content,            null: false
      t.integer    :school_category_id, null: false
      t.integer    :subject_id,         null: false
      t.integer    :grade_id,           null: false
      t.references :user,               null: false
      t.string     :data,               null: false
      t.timestamps
    end
  end
end
