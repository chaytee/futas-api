class ChangeRelationShipId < ActiveRecord::Migration[6.0]
  def change
    #emove_column :users, :relationship_id, :bigint
    add_column :tasks, :relationship_id, :bigint
    add_column :messages, :relationship_id, :bigint
    add_column :messages, :user_id, :bigint
    remove_column :relationships, :message_id, :bigint
    remove_column :relationships, :task_id, :bigint
    remove_column :relationships, :user_id, :bigint
  end
end
