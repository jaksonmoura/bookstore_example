class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :summary
      t.date :released_at
      t.string :edition
      t.string :isnb
      t.integer :pages

      t.timestamps
    end
  end
end
