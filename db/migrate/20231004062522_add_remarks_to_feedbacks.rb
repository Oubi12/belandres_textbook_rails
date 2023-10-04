class AddRemarksToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :remarks, :integer
  end