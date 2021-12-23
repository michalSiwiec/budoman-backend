Book.create!([
  {
    title: 'Clean Code'
  },
  {
    title: 'Bezpieczeństwo aplikacji Webowych'
  },
  {
    title: 'Agile Web development with rails'
  }
])

Author.create!([
  {
    first_name: 'Andrzej',
    last_name: 'Kowalczyk',
    book_id: Book.find_by(title: 'Clean Code').id
  },
  {
    first_name: 'Jan',
    last_name: 'Kowalski',
    book_id: Book.find_by(title: 'Bezpieczeństwo aplikacji Webowych').id
  },
  {
    first_name: 'Stefan',
    last_name: 'Nowak',
    book_id: Book.find_by(title: 'Agile Web development with rails').id
  }
])

Woman.create!([
  {
    name: 'Anna',
    surname: 'Nowak',
    age: 27,
    favourite_jacket: 'Example jacket1'
  },
  {
    name: 'Anna',
    surname: 'Kowalska',
    age: 21,
    favourite_jacket: 'Example jacket2'
  },
  {
    name: 'Krystyna',
    surname: 'Nowak',
    age: 57,
    favourite_jacket: 'Example jacket3'
  }
])

Man.create([
  {
    name: 'Adam',
    surname: 'Nowak',
    age: 33,
    favourite_car: 'Jaguar'
  },
  {
    name: 'Paweł',
    surname: 'Kowalski',
    age: 22,
    favourite_car: 'Toyota'
  },
  {
    name: 'Jakub',
    surname: 'Nowakowski',
    age: 77,
    favourite_car: 'Audi'
  }
])
