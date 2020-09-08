class ChangeSharingmodeDefaultOfAlbum < ActiveRecord::Migration[6.0]
  def change
    change_column_default :albums, :sharingmode, from: nil, to: true
  end
end
