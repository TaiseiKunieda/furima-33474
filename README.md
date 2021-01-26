#テーブル設計

## usersテーブル

|  Colum               |  Type    |  Options                    |
|  ------------------  |  ------  |  -------------------------  |
|  email               |  string  |  null: false, unique: true  |
|  encrypted_password  |  string  |  null: false                |
|  nickname            |  string  |  null: false                |
|  first_nameJ         |  string  |  null: false                |
|  last_nameJ          |  string  |  null: false                |
|  first_nameK         |  string  |  null: false                |
|  last_name           |  string  |  null: false                |
|  birthday            |  date    |  null: false                |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

|  Colum            |  Type        |  Options            |
|  ---------------  |  ----------  |  -----------------  |
|  name             |  string      |  null: false        |
|  explanation      |  text        |  null: false        |
|  category_id      |  integer     |  null: false        |
|  state_id         |  integer     |  null: false        |
|  postage_id       |  integer     |  null: false        |
|  area_id          |  integer     |  null: false        |
|  days_to_ship_id  |  integer     |  null: false        |
|  price            |  integer     |  null: false        |
|  user             |  references  |  foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchases


## purchasesテーブル

|  Colum          |  Type        |  Options            |
|  -------------  |  ----------  |  -----------------  |
|  user           |  references  |  foreign_key: true  |
|  item           |  references  |  foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address


## shipping_addressesテーブル

|  Colum           |  Type        |  Options            |
|  --------------  |  ----------  |  -----------------  |
|  postal_code     |  string      |  null: false        |
|  prefectures_id  |  integer     |  null: false        |
|  municipalities  |  string      |  null: false        |
|  address         |  string      |  null: false        |
|  building_name   |  string      |                     |
|  phone_number    |  string      |  null: false        |
|  purchase        |  references  |  foreign_key: true  |

### Association
- belongs_to :purchase