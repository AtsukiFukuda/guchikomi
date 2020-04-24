class AddSalaryToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :salary, :integer
  end
end
