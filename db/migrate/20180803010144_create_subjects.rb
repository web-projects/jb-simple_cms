class CreateSubjects < ActiveRecord::Migration[5.2]

  def up
    create_table :subjects do |t|
      t.column "name", :string, :limit => 25
      t.integer "position"
      t.boolean "visible", :default => false
      t.timestamps
    end
  end

  def down
    drop_table :subjects
  end

end
