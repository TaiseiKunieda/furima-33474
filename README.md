#テーブル設計

## usersテーブル

|  Colum               |  Type    |  Options      |
|  ------------------  |  ------  |  -----------  |
|  email               |  string  |  null: false  |
|  encrypted_password  |  string  |  null: false  |
|  nickname            |  string  |  null: false  |
|  first_nameJ         |  string  |  null: false  |
|  last_nameJ          |  string  |  null: false  |
|  first_nameK         |  string  |  null: false  |
|  last_name           |  string  |  null: false  |
|  birthday            |  date    |  null: false  |

### Association
- has_many :items
- has_many :comments


## itemsテーブル

|  Colum         |  Type        |  Options                    |
|  ------------  |  ----------  |  -------------------------  |
|  name          |  string      |  null: false, unique: true  |
|  explanation   |  text        |  null: false                |
|  category      |  string      |  null: false                |
|  state         |  integer     |  null: false                |
|  postage       |  integer     |  null: false                |
|  area          |  integer     |  null: false                |
|  days_to_ship  |  integer     |  null: false                |
|  price         |  integer     |  null: false                |
|  user          |  references  |  foreign_key: true          |

### Association
- belongs_to :user
- has_many :purchases


## purchasesテーブル

|  Colum          |  Type        |  Options            |
|  -------------  |  ----------  |  -----------------  |
|  card_number    |  string      |  null: false        |
|  limit_month    |  integer     |  null: false        |
|  limit_year     |  integer     |  null: false        |
|  security_code  |  integer     |  null: false        |
|  user           |  references  |  foreign_key: true  |
|  item           |  references  |  foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address


## shipping_addressesテーブル

|  Colum           |  Type    |  Options            |
|  --------------  |  ------  |  -----------------  |
|  postal_code     |  string  |  null: false        |
|  prefectures     |  string  |  null: false        |
|  municipalities  |  string  |  null: false        |
|  address         |  string  |  null: false        |
|  building_name   |  string  |                     |
|  phone_number    |  string  |  null: false        |
|  purchase        |  string  |  foreign_key: true  |

### Association
- belongs_to :purchase