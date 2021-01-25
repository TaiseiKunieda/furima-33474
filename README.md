#テーブル設計

## usersテーブル

|  Colum        |  Type    |  Options  
|  -----------  |  ------  |  ------   
|  email        |  string  |  null: false  |
|  password     |  string  |  null: false  |
|  nickname     |  string  |  null: false  |
|  first_nameJ  |  string  |  null: false  |
|  last_nameJ   |  string  |  null: false  |
|  first_nameK  |  string  |  null: false  |
|  last_nameK   |  string  |  null: false  |
|  birthday     |  date    |  null: false  |

### Association
- has_many :items
- has_many :comments

## itemsテーブル

|  Colum         |  Type     |  Options      |
|  ------------  |  -------  |  -----------  |
|  name          |  text     |  null: false  |
|  explanation   |  text     |  null: false  |
|  category      |  string   |  null: false  |
|  state         |  string   |  null: false  |
|  postage       |  text     |  null: false  |
|  area          |  string   |  null: false  |
|  Days_to_ship  |  text     |  null: false  |
|  price         |  integer  |  null: false  |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

|  Colum  |  Type    |  Options      |
|  -----  |  ------  |  -----------  |
|  text   |  text    |  null: false  |
|  user   |  string  |  null: false  |
|  item   |  string  |  null: false  |

### Association
- belongs_to :user
- belongs_to :item