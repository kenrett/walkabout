class AddJumpLinkToBooks < ActiveRecord::Migration
  def change
    add_column :books, :jump_link, :string
  end
end
