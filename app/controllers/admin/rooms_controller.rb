class Admin::RoomsController < Admin::ApplicationController
  inherit_resources

  def index
    @rooms = Room.order('name asc')
  end

  def create
    create! { admin_rooms_path }
  end

  def update
    update! { admin_rooms_path }
  end

end