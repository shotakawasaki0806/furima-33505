# README

## users テーブル

|Column    | Type    | Options     |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| kana     | string  | null: false |
| birthday | integer | null: false |

### Association

has_many :items
has_many :buys

## items テーブル

| Column   | Type       | Options                        |
| user     | references | null: false, foreign_key: true |
| product  | string     | null: false                    |
| price    | integer    | null: false                    |
| category | string     | null: false                    |
| state    | string     | null: false                    |
| postage  | string     | null: false                    |
| area     | string     | null: false                    |
| date     | string     | null: false                    |

### Association
has_one :buy
belongs_to :user

## buys テーブル

| Column  | Type       | Options                        |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association
has_one :address
belongs_to :user
belongs_to :item

## addresses テーブル

| Column  | Type    | Options     |
| phone   | integer | null: false |
| address | string  | null: false |

### Association
belongs_to :buy