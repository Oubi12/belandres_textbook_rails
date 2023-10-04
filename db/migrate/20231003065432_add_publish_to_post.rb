class AddPublishToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :published, :string
  end
end
