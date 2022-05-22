class Subject < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '国語' },
    { id: 3, name: '算数・数学' },
    { id: 4, name: '英語' },
    { id: 5, name: '理科' },
    { id: 6, name: '社会' },
    { id: 7, name: '保健・体育' },
    { id: 8, name: '家庭' },
    { id: 9, name: '図工・技術' },
    { id: 10, name: '情報' },
    { id: 11, name: '美術' },
    { id: 12, name: '音楽' },
    { id: 13, name: '書道' },
    { id: 14, name: '道徳' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users

end