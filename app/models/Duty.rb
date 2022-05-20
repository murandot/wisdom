class Duty < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '教務' },
    { id: 3, name: '総務' },
    { id: 4, name: '生活指導・生徒指導' },
    { id: 5, name: '進路指導' },
    { id: 6, name: '情報・システム' },
    { id: 7, name: '保健' },
    { id: 8, name: '図書' },
    { id: 9, name: 'その他' },
    { id: 10, name: 'その他' }
  ]
  
  include ActiveHash::Associations
  has_many :users

end