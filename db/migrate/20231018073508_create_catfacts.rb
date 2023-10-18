class CreateCatfacts < ActiveRecord::Migration[7.0]
  def change
    create_table :catfacts do |t|
      t.text :fact
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
