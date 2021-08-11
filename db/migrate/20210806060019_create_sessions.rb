class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :stakes
      t.integer :hours_played
      t.string :location
      t.string :belongs_to
      t.decimal :buy_in
      t.decimal :out_for

      t.timestamps
    end
  end
end
