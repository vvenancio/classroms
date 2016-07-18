class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.datetime :entry_at
    end

    add_index :class_rooms, [:student_id, :course_id], unique: true
  end
end
