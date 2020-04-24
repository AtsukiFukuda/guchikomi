class AddWorkLocationToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :work_location, :string
  end
end
