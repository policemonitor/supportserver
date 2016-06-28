class CarsController < ApplicationController
  def index
    @cars = Car.where(deleted: false)
    @hash = Gmaps4rails.build_markers(@cars) do |car, marker|
      marker.lat car.latitude
      marker.lng car.longitude
      marker.title car.car_number
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render action: 'show', status: :created, location: @car }
      else
        format.html { render action: 'new' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @car = Car.extract_car params["car_name"], params["vin_number"], params["car_number"]
    @car = Car.find(params[:id]) if @car.nil?

    respond_to do |format|
      if @car.update(car_update_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated. '}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car = Car.extract_car params["car_name"], params["vin_number"], params["car_number"]
    @car = Car.find(params[:id]) if @car.nil?

    respond_to do |format|
      if !@car.nil? && @car.update_attribute(:deleted, true)
        format.html { redirect_to @car, notice: 'Car was successfully deleted.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def car_params
      params.require(:car).permit(:car_number, :vin_number, :crew_name)
    end

    def car_update_params
      params.require(:car).permit(:car_number, :vin_number, :crew_name, :longitude, :latitude, :on_duty, :on_a_mission)
    end
end
