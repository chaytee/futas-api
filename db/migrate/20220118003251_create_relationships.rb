class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|

      t.references :user
      t.references :task
      t.references :message
      t.string :paircode, unique: true
      t.timestamps
    end
  end
end
