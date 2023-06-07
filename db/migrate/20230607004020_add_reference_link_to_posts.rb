class AddReferenceLinkToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reference_link, :string
  end
end
