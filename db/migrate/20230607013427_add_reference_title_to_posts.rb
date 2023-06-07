class AddReferenceTitleToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reference_title, :string
  end
end
