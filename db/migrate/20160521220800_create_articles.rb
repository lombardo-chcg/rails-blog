class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :author_first_name
      t.string  :author_last_name

      t.timestamps null: false
    end
  end
end
