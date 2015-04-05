class CreateJoinTableBookGuide < ActiveRecord::Migration
  def change
    create_join_table :books, :guides do |t|
      # t.index [:book_id, :guide_id]
      # t.index [:guide_id, :book_id]
    end
  end
end
