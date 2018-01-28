json.array! @guests do |guest|
  # json.name guest.name
  # json.age guest.age
  # json.favorite_color guest.favorite_color
  if guest.age > 40 && guest.age < 50
    json.partial! 'api/guests/guest', guest: guest
  end
end
