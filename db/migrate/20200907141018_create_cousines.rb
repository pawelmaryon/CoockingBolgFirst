class CreateCousines < ActiveRecord::Migration[6.0]
  def change
    create_table :cousines do |t|
      t.string :name
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
