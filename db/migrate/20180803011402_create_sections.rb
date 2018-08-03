class CreateSections < ActiveRecord::Migration[5.2]

  def up
    create_table :sections do |t|
      t.column "page_id", :integer
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => false
      t.string "content_type"
      t.text "content"
      t.timestamps
    end
    add_index("sections", "page_id")
  end

  def down
    drop_table :sections
  end

end
