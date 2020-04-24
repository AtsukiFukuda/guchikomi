class AddCompanyNameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :company_name, :string
  end
end
