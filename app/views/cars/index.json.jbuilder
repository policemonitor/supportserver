#json.array!(@cars) do |car|
#  json.extract! car, :latitude, :longitude, :address, :description, :title
#  json.url car_url(car, format: :json)
#end
json.array!(@cars) do |car|
  json.car car.crew_name
  json.details do
    json.car_number car.car_number
    json.latitude car.latitude
    json.longitude car.longitude
    json.vin_number car.vin_number
  end
  json.statuses do
    json.on_duty car.on_duty
    json.on_a_mission car.on_a_mission
  end
end
