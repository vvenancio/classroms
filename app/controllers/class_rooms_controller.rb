class ClassRoomsController < ApplicationController
  before_action :set_class_room, only: [:edit, :update]

  def index
    @class_rooms = ClassRoom.all

    respond_with(@class_rooms)
  end

  def new
    @class_room = ClassRoom.new

    respond_with(@class_room)
  end

  def create
    @class_room = ClassRoom.new(class_room_attributes)
    @class_room.save

    respond_with(@class_room, location: class_rooms_path)
  end

  def edit
    respond_with(@class_room)
  end

  def update
    @class_room.update(class_room_attributes)

    respond_with(@class_room, location: class_rooms_path)
  end

  private

  def class_room_attributes
    params.require(:class_room).permit(:student_id, :course_id, :entry_at)
  end

  def set_class_room
    @class_room = ClassRoom.find(params[:id])
  end
end