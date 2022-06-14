# アプリケーション名
wisdom
<br>
<br>
<br>

# アプリケーション概要
教員同士が、教材や指導法、悩み等を共有することで、仕事の効率化とモチベーションを向上させることができる。
<br>
<br>
<br>

# URL
https://wisdom-2022.herokuapp.com/
<br>
<br>
<br>

# テスト用アカウント
- Basic認証用ID：murayama
- Basic認証用パスワード：wisdom
- メールアドレス：aaa111@gwisdom.com
- パスワード：aaa111
<br>
<br>
<br>


# 利用方法
## 教材・記事・相談の投稿
1. トップページから「新規登録」を押し、ユーザー新規登録を行う
2. ヘッダーの「投稿」を押し、投稿する項目を選び、必要情報を入力し投稿する
3. 記事と教材はサムネイルとなる画像を、教材は教材のデータを添付することができる。
<br>
<br>

## 教材のダウンロード
1. ヘッダーの「教材を見る」から教材一覧表示画面へ行く
2. 閲覧する投稿のタイトルを押し、詳細表示画面で内容を確認する
3. 投稿下部のファイル名をクリックして教材をダウンロードすることができる
<br>
<br>

## 　投稿へのコメント機能
1. コメントする投稿の詳細表示画面へいく
2. 画面下部のコメントフォームにコメントを記入し投稿する
<br>
<br>
<br>

# 開発の経緯
前職の経験から、教員の多忙感を身を持って経験した。授業以外の他の業務と並行しながら、授業の教材準備に十分な時間を確保することの困難さを痛感した。<br>
私は周囲に恵まれたため教材や指導方法を教わる機会も多かったが、地域や環境によっては周囲の助けを得られずに頑張っている教員も少なくないと考えた。<br>
そこで、教員同士が繋がり、教材を共有することができる本アプリケーションの開発に至った。また、指導方法や悩みなどを共有することで、仕事に対するモチベーションが向上することも期待している。
<br>
<br>
<br>

# 洗い出した要件
要件を定義したシート：https://x.gd/RUfdL
<br>
<br>
<br>

# 実装した機能のGIF及び説明
画像にて記載予定
<br>
<br>
<br>

# 実装予定の機能
- 検索機能
- お気に入り機能
- フォロー機能
- タグ検索機能
- 通知機能
- ランキング表示機能
- アンケート機能
- 教材のデータ複数投稿機能
- 記事の文字装飾機能
- 記事の画像挿入機能
- 記事のURLサムネイル表示機能　等
<br>
<br>
<br>

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/4b9a27ed902c6999888bc49fb759c68a.png)](https://gyazo.com/4b9a27ed902c6999888bc49fb759c68a)
<br>
<br>
<br>

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/743278fb339117f8a453e1563fc22022.png)](https://gyazo.com/743278fb339117f8a453e1563fc22022)
<br>
<br>
<br>

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テキストエディタ
- タスク管理
<br>
<br>
<br>

# ローカルでの動作方法
以下のコマンドを順に実行<br>
% git clone https://wisdom-2022.herokuapp.com/<br>
% cd wisdom<br>
% bundle install<br>
% yarn install<br>
<br>
<br>
<br>

# 工夫したポイント
## 1.　主要３機能（教材・記事・相談機能）の実装
- ３機能を実装することでノウハウを提供できる人、必要としている人が双方向に発信することができる
- 教材・記事機能は、ノウハウを持っている人が主体的に発信するための機能
- 相談機能は、困りごとを抱えている人が課題を解決するノウハウを募集するために発信する機能
<br>
<br>

## 2.　CarrierWave（gem）による教材データおよびユーザープロフィール画像投稿機能
- 教材データの形式として、画像はもちろん、pdfやoffice形式にも対応している
- 各ページに合わせた様々なサイズのユーザープロフィール画像の表示が容易になった
<br>
<br>

## 3.　jQueryによるヘッダーのメニューの表示/非表示切り替え機能
- jQueryを導入し、ヘッダーメニューの表示/非表示を切り替えられる
- 投稿ボタンを１つ設置し、そこから教材・記事・相談の全てを投稿することができる
- それによって、デザインのシンプルさと利便性を両立することができている
<br>
<br>

## 4. シンプルかつわかりやすい、万人にとって使いやすいデザイン
- 大勢の人に使ってもらえるアプリケーションとなるよう、極力シンプルでわかりやすいデザインを心掛けた
- ユーザーが３つの機能を識別しやすいように、一覧表示のレイアウトをそれぞれ差別化した
- ヘッダーにアイコンやボタンを使い、初めてのユーザーでもわかりやすいデザインにした。
<br>
<br>


## 5. ホーム画面でのユーザーに合わせた教材・記事のレコメンド機能
- ユーザー登録時の情報に合わせて、教材や記事をホーム画面に表示することができる
- コントローラーでユーザーのカラムと一致したデータのみを、数を制限しつつ、新着順に表示することができる
<br>
<br>
<br>
<br>

# テーブル設計

## users テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | -----------------------------------------------|
| nickname           | string     | null: false                                    |
| email              | string     | null: false                                    |
| encrypted_password | string     | null: false                                    |
| school_category_id | integer    | null: false                                    |
| subject_id         | integer    | null: false                                    |
| grade_id           | integer    |                                                |
| club_id            | integer    |                                                |
| duty_id            | integer    |                                                |
| avatar             | string     |                                                |
<br>
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
<br>
<br>

## materials 　テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| title              | string     | null: false                                    |
| content            | text       | null: false                                    |
| school_category_id | integer    | null: false                                    |
| subject_id         | integer    | null: false                                    |
| grade_id           | integer    |                                                |
| user               | references | null: false, foreign_key: true                 |
| data               | string     | null: false                                    |
<br>

### Association
- belongs_to :user
- has_many :feedbacks
- has_many :material_favorites
- has_many :material_tags, through: material_taggings
- has_many :material_taggings
<br>
<br>

## articles テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| title              | string     | null: false                                    |
| content            | text       | null: false                                    |
| user               | references | null: false, foreign_key: true                 |
| grade_id           | integer    | null: false                                    |
| school_category_id | integer    |                                                |
| image              | string     |                                                |
<br>

### Association
- belongs_to :user
- has_many :comments
- has_many :article_favorites
- has_many :article_tags, through: article_taggings
- has_many :article_taggings
<br>
<br>

## questions テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| title              | string     | null: false                                    |
| content            | text       | null: false                                    |
| grade_id           | integer    | null: false                                    |
| school_category_id | integer    |                                                |
| user               | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :user
- has_many :answers
- has_many :queation_tags, through: question_taggings
- has_many :question_taggings
<br>
<br>

## feedbacks テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| content            | text       | null: false                                    |
| user               | references | null: false, foreign_key: true                 |
| material           | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :user
- belongs_to :material
<br>
<br>

## comments テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| content            | text       | null: false                                    |
| user               | references | null: false, foreign_key: true                 |
| articles           | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :user
- belongs_to :article
<br>
<br>

## answers テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| content            | text       | null: false                                    |
| user               | references | null: false, foreign_key: true                 |
| question           | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :user
- belongs_to :question
<br>
<br>

## material_tags テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| name               | string     | null: false                                    |
| material_tagging   | references | null: false, foreign_key: true                 |
<br>

### Association
- has_many :materials, through: :material_tagging
- belongs_to :material_tagging
<br>
<br>

## article_tags テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| name               | string     | null: false                                    |
| article_tagging    | references | null: false, foreign_key: true                 |
<br>

### Association
- has_many :articles, through: :article_tagging
- belongs_to :article_tagging
<br>
<br>

## question_tags テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| name               | string     | null: false                                    |
| question_tagging   | references | null: false, foreign_key: true                 |
<br>

### Association
- has_many :questions, through: :question_tagging
- belongs_to :question_tagging
<br>
<br>

## material_taggings テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| material           | references | null: false, foreign_key: true                 |
| material_tags      | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :material
- belongs_to :material_tag
<br>
<br>

## article_taggings テーブル
| Column              | Type       | Option                                        |
| ------------------- | ---------- | --------------------------------------------- |
| article             | references | null: false, foreign_key: true                |
| article_tags        | references | null: false, foreign_key: true                |
<br>

### Association
- belongs_to :article
- belongs_to :article_tag
<br>
<br>

## question_taggings テーブル
| Column              | Type       | Option                                        |
| ------------------- | ---------- | --------------------------------------------- |
| question            | references | null: false, foreign_key: true                |
| question_tags       | references | null: false, foreign_key: true                |
<br>

### Association
- belongs_to :question
- belongs_to :question_tag
<br>
<br>

## material_favorites テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| user               | references | null: false, foreign_key: true                 |
| material           | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :user
- belongs_to :material
<br>
<br>

## article_favorites テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| user               | references | null: false, foreign_key: true                 |
| articles           | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :user
- belongs_to :article
<br>
<br>

## relationships テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| user               | references | null: false, foreign_key: true                 |
| follow             | references | null: false, foreign_key: { to_table: :users } |
<br>

### Association
- belongs_to :user
- belongs_to :follow, class_name: 'User'
<br>
<br>

## rooms テーブル
| Column             | Type        | Option                                        |
| ------------------ | ----------- | --------------------------------------------- |
| name               | string      | null: false                                   |
<br>

### Association
- has_many :users, through: :members
- has_many :members
- has_many :messages
<br>
<br>

## members テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| user               | references | null: false, foreign_key: true                 |
| room               | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :users
- belongs_to :members
<br>
<br>

## messages テーブル
| Column             | Type       | Option                                         |
| ------------------ | ---------- | ---------------------------------------------- |
| content            | text       |                                                |
| user               | references | null: false, foreign_key: true                 |
| room               | references | null: false, foreign_key: true                 |
<br>

### Association
- belongs_to :users
- belongs_to :rooms

