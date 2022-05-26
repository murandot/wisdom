class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,              null: false
      t.text       :content,            null: false
      t.integer    :genre_id,           null: false
      t.integer    :school_category_id
      t.string     :image
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
