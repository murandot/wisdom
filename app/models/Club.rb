class Club < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '野球' },
    { id: 3, name: 'ソフトボール' },
    { id: 4, name: 'サッカー' },
    { id: 5, name: '陸上' },
    { id: 6, name: '硬式テニス' },
    { id: 7, name: 'ソフトテニス' },
    { id: 8, name: 'ラグビー' },
    { id: 9, name: 'ホッケー' },
    { id: 10, name: 'バスケットボール' },
    { id: 11, name: 'バレーボール' },
    { id: 12, name: 'バドミントン' },
    { id: 13, name: '卓球' },
    { id: 14, name: '水泳' },
    { id: 15, name: '空手' },
    { id: 16, name: '柔道' },
    { id: 17, name: '剣道' },
    { id: 18, name: '弓道' },
    { id: 19, name: '吹奏楽' },
    { id: 20, name: '軽音楽' },
    { id: 21, name: '合唱' },
    { id: 22, name: 'チア・ダンス' },
    { id: 23, name: '文芸' },
    { id: 24, name: '茶道' },
    { id: 25, name: '書道' },
    { id: 26, name: '演劇' },
    { id: 27, name: '写真' },
    { id: 28, name: '美術' },
    { id: 29, name: '科学（物理・化学・生物・地学）' },
    { id: 30, name: '家庭科' },
    { id: 31, name: '放送' },
    { id: 32, name: '生徒会' }
  ]

  include ActiveHash::Associations
  has_many :users

end