class ChangeSharingmodeOfPhoto < ActiveRecord::Migration[6.0]
  def change
    change_column :photos, :sharingmode,  'boolean USING CAST(sharingmode AS boolean)'
  end
end
