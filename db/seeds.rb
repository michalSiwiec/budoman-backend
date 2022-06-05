User.create!([
  {
    email: 'andrzej123@gmail.com',
    password: '1234Hbjkadasd',
    avatars: []
  },
  {
    email: 'pawel123@gmail.com',
    password: '1234Hbjkajjkkaasd',
    avatars: []
  }
])

Opinion.create!([
  {
    content: 'Szeroki wybór oraz miła obsługa klienta. Napewno tu wrócę',
    mark: 5,
    user_id: User.first.id
  },
  {
    content: 'Szybka dostawa, polecam.',
    mark: 4,
    user_id: User.second.id
  }
])

Product.create!([
  {
    name: 'Mlotek',
    price: 44.55,
    available_quantity: 12,
    picture: ''
  },
  {
    name: 'Koparka',
    price: '200000',
    available_quantity: 3,
    picture: ''
  }
])
