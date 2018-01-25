class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.text :url
      t.text :description

      t.timestamps
    end
  end
end
