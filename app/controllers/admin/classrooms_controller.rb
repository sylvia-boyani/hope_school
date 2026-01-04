class Admin::ClassRoomsController < Admin::BaseController
  before_action :set_class_room, only: %i[show edit update destroy]

  def index
    @class_rooms = ClassRoom.includes(:level).order("levels.order ASC, class_rooms.stream ASC")
  end

  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.new(class_room_params)
    if @class_room.save
      redirect_to admin_class_rooms_path, notice: "Class Room created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @class_room.update(class_room_params)
      redirect_to admin_class_rooms_path, notice: "Class Room updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @class_room.destroy
    redirect_to admin_class_rooms_path, notice: "Class Room deleted successfully."
  end

  private

  def set_class_room
    @class_room = ClassRoom.find(params[:id])
  end

  def class_room_params
    params.require(:class_room).permit(:level_id, :stream)
  end
end
