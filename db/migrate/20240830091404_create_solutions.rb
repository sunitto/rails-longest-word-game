class CreateSolutions < ActiveRecord::Migration[7.1]
  def change
    create_table :solutions do |t|
      t.string :sol_word
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
