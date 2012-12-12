class AddInvitationToGame < ActiveRecord::Migration
  def change
    add_column :games, :invite, :string  # email address
    add_column :games, :public, :boolean, default: true
  end
end
