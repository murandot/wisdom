class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '教科指導' },
    { id: 3, name: '生徒指導' },
    { id: 4, name: '校務分掌' },
    { id: 5, name: 'クラブ活動・部活動' },
    { id: 6, name: '人間関係' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
  #has_many :questions

end