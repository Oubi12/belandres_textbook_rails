class AddUserIdToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :email
    add_reference :feedbacks, :user
  end
end
