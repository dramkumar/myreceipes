class AddChefIdToReceipes < ActiveRecord::Migration
  def change
    add_column :receipes, :chef_id, :integer
  end
end
