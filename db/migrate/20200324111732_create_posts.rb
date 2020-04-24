class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      #追加箇所

      t.text :body

      #ここまで
      t.timestamps
    end
  end
end
