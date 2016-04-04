#json.array!(@users) do |user|
#  json.extract! user, :latitude, :longitude, :address, :description, :title
#  json.url user_url(user, format: :json)
#end
json.array!(@users) do |user|
  json.car user.title
  json.details do
    json.latitude user.latitude
    json.rating user.longitude
  end
end
