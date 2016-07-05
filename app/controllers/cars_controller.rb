class CarsController < ApplicationController
  before_action :check_api_key, only: [:index, :new, :edit, :create, :update, :destroy]

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
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update(car_update_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if Car.find(params[:id]).update_attribute(:deleted, true)
        format.html { redirect_to @car, notice: 'Car was successfully deleted.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def check_api_key
      if (!params[:key].eql? APP_CONFIG['key']) || params[:key].nil?
        puts "======================== WRONG API KEY! ========================="
        respond_to do |format|
          format.html { redirect_to nonauth_path }
          format.json { render nothing: true, status: :unauthorized }
        end
      end
    end

    def car_params
      params.require(:car).permit(:car_number, :vin_number, :car_name)
    end

    def car_update_params
      params.require(:car).permit(:car_number,
                                  :vin_number, :car_name,
                                  :longitude, :latitude,
                                  :on_duty, :on_a_mission)
    end
end
