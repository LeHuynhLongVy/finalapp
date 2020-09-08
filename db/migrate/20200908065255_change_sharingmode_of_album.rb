class ChangeSharingmodeOfAlbum < ActiveRecord::Migration[6.0]
  def change
    change_column :albums, :sharingmode,  'boolean USING CAST(sharingmode AS boolean)'
  end
end
