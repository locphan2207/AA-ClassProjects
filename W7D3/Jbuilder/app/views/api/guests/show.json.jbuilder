# json.extract! @guest, :name, :age, :favorite_color
json.partial! 'api/guests/guest', guest: @guest
json.gifts @guest.gifts do |gift|
  json.extract! gift, :title, :description
end