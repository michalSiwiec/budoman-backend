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

ProductCathegory.create!([
  { name: 'constuction_chemicals' }
])

products_bucket_path = 'https://olx-development.s3.eu-central-1.amazonaws.com/images/products'

Product.create!([
  {
    name: 'Głądź gipsowa',
    price: 212.55,
    available_quantity: 10,
    picture_path: "#{products_bucket_path}/constuction_chemicals/gladz_gipsowa.jpeg",
    product_cathegory: ProductCathegory.find_by(name: 'constuction_chemicals')
  },
  {
    name: 'Grunt głęboko penetrujący',
    price: 174.99,
    available_quantity: 10,
    picture_path: "#{products_bucket_path}/constuction_chemicals/grunt_gleboko_penetrujacy.jpeg",
    product_cathegory: ProductCathegory.find_by(name: 'constuction_chemicals')
  },
  {
    name: 'Klej do dociepleń',
    price: 150.99,
    available_quantity: 10,
    picture_path: "#{products_bucket_path}/constuction_chemicals/klej_do_dociepleń.png",
    product_cathegory: ProductCathegory.find_by(name: 'constuction_chemicals')
  },
  {
    name: 'Klej do styropianu',
    price: 150.99,
    available_quantity: 10,
    picture_path: "#{products_bucket_path}/constuction_chemicals/klej_do_styropianu.jpeg",
    product_cathegory: ProductCathegory.find_by(name: 'constuction_chemicals')
  },
  {
    name: 'Tynk akrylowy',
    price: 120.99,
    available_quantity: 10,
    picture_path: "#{products_bucket_path}/constuction_chemicals/tynk akrylowy.jpeg",
    product_cathegory: ProductCathegory.find_by(name: 'constuction_chemicals')
  },
  {
    name: 'Tynk mozaikowy',
    price: 110.99,
    available_quantity: 10,
    picture_path: "#{products_bucket_path}/constuction_chemicals/tynk_mozaikowy.jpeg",
    product_cathegory: ProductCathegory.find_by(name: 'constuction_chemicals')
  },
  {
    name: 'Tynk nanosilikonowy',
    price: 80.99,
    available_quantity: 10,
    picture_path: "#{products_bucket_path}/constuction_chemicals/tynk_nanosilikonowy.png",
    product_cathegory: ProductCathegory.find_by(name: 'constuction_chemicals')
  }
])
