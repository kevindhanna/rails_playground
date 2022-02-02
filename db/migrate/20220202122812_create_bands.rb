class CreateBands < ActiveRecord::Migration[6.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.references :location, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
