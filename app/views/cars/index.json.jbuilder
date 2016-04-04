#json.array!(@cars) do |car|
#  json.extract! car, :latitude, :longitude, :address, :description, :title
#  json.url car_url(car, format: :json)
#end
json.array!(@cars) do |car|
  json.car car.title
  json.details do
    json.latitude car.latitude
    json.rating car.longitude
  end
end
