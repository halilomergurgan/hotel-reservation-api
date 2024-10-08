class CalendarsController < ApplicationController
  before_action :set_calendar, only: [ :show, :update, :destroy ]

  # GET /calendars
  def index
    @calendars = Calendar.all
    render json: @calendars
  end

  # GET /calendars/:id
  def show
    render json: @calendar
  end

  # POST /calendars
  def create
    @calendar = Calendar.new(calendar_params)

    if @calendar.save
      render json: @calendar, status: :created
    else
      render json: @calendar.errors, status: :unprocessable_entity
    end
  end

  # PUT /calendars/:id
  def update
    if @calendar.update(calendar_params)
      render json: @calendar
    else
      render json: @calendar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /calendars/:id
  def destroy
    @calendar.destroy
    head :no_content
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:room_id, :date, :available, :price)
  end
end
