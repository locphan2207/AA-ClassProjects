# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'locphan')
User.create(username: 'cris767')
User.create(username: 'chao33')
User.create(username: 'niel123')

Artwork.create(title: 'House', artist_id: 4, image_url: 'http:test.com/house')
Artwork.create(title: 'Cloud', artist_id: 4, image_url: 'http:test.com/cloud')
Artwork.create(title: 'Cat', artist_id: 1, image_url: 'http:test.com/132')
Artwork.create(title: 'Dog', artist_id: 2, image_url: 'http:test.com/18')
Artwork.create(title: 'Duck', artist_id: 3, image_url: 'http:test.com/16')
Artwork.create(title: 'Girl', artist_id: 3, image_url: 'http:test.com/12')
Artwork.create(title: 'Boy', artist_id: 2, image_url: 'http:test.com/14')

Artshare.create(artwork_id: 1, viewer_id: 1)
Artshare.create(artwork_id: 1, viewer_id: 2)
Artshare.create(artwork_id: 1, viewer_id: 3)
Artshare.create(artwork_id: 1, viewer_id: 4)
Artshare.create(artwork_id: 1, viewer_id: 2)
Artshare.create(artwork_id: 2, viewer_id: 3)
Artshare.create(artwork_id: 3, viewer_id: 3)
Artshare.create(artwork_id: 4, viewer_id: 2)
Artshare.create(artwork_id: 5, viewer_id: 1)
Artshare.create(artwork_id: 6, viewer_id: 0)