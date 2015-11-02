class AddPictureToReceipes < ActiveRecord::Migration
  def change
    add_column :receipes, :picture, :string
  end
end
