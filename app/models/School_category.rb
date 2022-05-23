class SchoolCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '幼稚園・保育園' },
    { id: 3, name: '小学校' },
    { id: 4, name: '中学校' },
    { id: 5, name: '高等学校' },
    { id: 6, name: '特別支援学校' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :materials

end