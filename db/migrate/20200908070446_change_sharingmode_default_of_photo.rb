class ChangeSharingmodeDefaultOfPhoto < ActiveRecord::Migration[6.0]
  def change
    change_column_default :photos, :sharingmode, from: nil, to: true
  end
end
