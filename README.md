# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column             | Type    | Option      |
| ------------------ | ------- | ------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| school_category_id | integer | null: false |
| subject_id         | integer | null: false |
| grade_id           | integer |             |
| club_id            | integer |             |
| duty_id            | integer |             |
| avatar             | string  |             |

### Association
- has_many :mamterials
- has_many :articles
- has_many :questions
- has_many :feedbacks
- has_many :comments
- has_many :answers
- has_many :material_favorites
- has_many :article_favorites
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user
- has_many :rooms, through: :rooms
- has_many :members
- has_many :messages



## materials 　テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| content            | string     | null: false                    |
| school_category_id | integer    | null: false                    |
| subject_id         | integer    | null: false                    |
| grade_id           | integer    |                                |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :feedbacks
- has_many :material_favorites
- has_many :material_tags, through: material_taggings
- has_many :material_taggings



## articles テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :article_favorites
- has_many :article_tags, through: article_taggings
- has_many :article_taggings



## questions テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :answers
- has_many :queation_tags, through: question_taggings
- has_many :question_taggings



## feedbacks テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| material           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :material



## comments テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| articles           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :article



## answers テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| question           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :question



## material_tags テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| material_tagging   | references | null: false, foreign_key: true |

### Association
- has_many :materials, through: :material_tagging
- belongs_to :material_tagging



## article_tags テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| article_tagging    | references | null: false, foreign_key: true |

### Association
- has_many :articles, through: :article_tagging
- belongs_to :article_tagging



## question_tags テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| question_tagging   | references | null: false, foreign_key: true |

### Association
- has_many :questions, through: :question_tagging
- belongs_to :question_tagging



## material_taggings テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| material           | references | null: false, foreign_key: true |
| material_tags      | references | null: false, foreign_key: true |

### Association
- belongs_to :material
- belongs_to :material_tag



## article_taggings テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| article            | references | null: false, foreign_key: true |
| article_tags       | references | null: false, foreign_key: true |

### Association
- belongs_to :article
- belongs_to :article_tag



## question_taggings テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| question            | references | null: false, foreign_key: true |
| question_tags       | references | null: false, foreign_key: true |



## material_favorites テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| material           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :material



## article_favorites テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| articles           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :article



## relationships テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| user               | references | null: false, foreign_key: true                 |
| follow             | references | null: false, foreign_key: { to_table: :users } |

### Association
- belongs_to :user
- belongs_to :follow, class_name: 'User'



## rooms テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| member             | references | null: false, foreign_key: true |
| message            | references | null: false, foreign_key: true |

### Association
- has_many :users, through: :members
- has_many :members
- has_many :messages



## members テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| room               | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :members



## messages テーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| content            | text       |                                |
| user               | references | null: false, foreign_key: true |
| room               | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :rooms


