class CreateOranges < ActiveRecord::Migration
  def change
    create_table :oranges do |t|
      t.string :description

      t.timestamps

    end
  end
end
