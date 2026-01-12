class CreateFoos < ActiveRecord::Migration[7.2]

  def change
    create_table :foos do |t|
      t.string :bar
      t.timestamps
    end
  end
end
