# テーブル設計

## users テーブル（ユーザー情報）（deviseを使う）

| Column                                     | Type       | Options                                |
| ------------------------------------------ | ---------- | -------------------------------------- |
| nick_name                                  | string     | null: false                            |
| email                                      | string     | null: false ,unique: true ,default: "" |
| encrypted_password                         | string     | null: false ,default: ""               |
| first_name                                 | string     | null: false                            |
| last_name                                  | string     | null: false                            |

### Association
- has_many : questions     
- has_many : comments                         



## 　questions テーブル（質問投稿機能）

| Column                                     | Type       | Options                                |
| ------------------------------------------ | ---------- | -------------------------------------- |
| user                                       | references | null: false, foreign_key: true         |  
| title                                      | string     | null: false                            |
| content                                    | text       | null: false                            |
| tag                                        | integer    | null: false                            |

###  Association
- belongs_to : user
- has_many : comments


## comments テーブル（コメント機能）

| Column                                     | Type       | Options                                |
| ------------------------------------------ | ---------- | -------------------------------------- |
| user                                       | references | null: false, foreign_key: true         |
| comment                                    | text       | null: false                            |
###  Association
- belongs_to : user
- has_many : comments

