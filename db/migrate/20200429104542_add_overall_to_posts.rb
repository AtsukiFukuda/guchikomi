class AddOverallToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :overall, :integer
  end
end
