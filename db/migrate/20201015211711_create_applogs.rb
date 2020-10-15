class CreateApplogs < ActiveRecord::Migration[6.0]
  def change
    create_table :applogs do |t|
      t.string :controller
      t.string :action
      t.integer :object_id

      t.timestamps
    end
  end
end
