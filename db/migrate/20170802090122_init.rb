class Init < ActiveRecord::Migration[5.1]
  def change

    # 可加强的约束
    # limit 修饰符：设置 string/text/binary/integer 字段的最大长度。
    # precision 修饰符：定义 decimal 字段的精度，表示数字的总位数。
    # scale 修饰符：定义 decimal 字段的标度，表示小数点后的位数。
    # polymorphic 修饰符：为 belongs_to 关联添加 type 字段。
    # null 修饰符：设置字段能否为 NULL 值。
    # default 修饰符：设置字段的默认值。请注意，如果使用动态值（如日期）作为默认值，那么默认值只会在第一次使时（如应用迁移的日期）计算一次。
    # index 修饰符：为字段添加索引。
    # comment 修饰符：为字段添加注释。
    # unique ??

    # [用户账户]
    create_table :users do |t|
      t.string :avatar
      t.string :nickname
      t.string :wechat, unique: true
      t.string :mobile, unique: true
      t.string :name
      t.integer :gender, default: 0
      t.string :school
      t.string :grade
      t.string :major
      t.boolean :completed, default: false
      t.boolean :admin, default: false

      t.timestamps
    end

    # {类型}(<=[主题])
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    # {标签}(<=[主题])
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    # <主题标签>
    create_join_table :tags, :topics do |t|
      t.index :tag_id
      t.index :topic_id
    end

    # {子话题}=>[主题]
    create_table :topics_subtopics do |t|
      t.string :name
      t.string :content
      t.references :topic, foreign_key: true

      t.timestamps
    end

    # [主题]=>[类型](<=[子话题]&[标签])
    create_table :topics do |t|
      t.string :name
      t.references :category, foreign_key: true

      t.timestamps
    end

    # [场地]
    create_table :sites do |t|
      t.string :name
      t.string :image
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    # [活动]=>[场地]&[主题](<=[用户])
    create_table :activities do |t|
      t.datetime :time
      t.text :content
      t.references :site, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end

    # <参与>=>[用户账户]&[活动]
    create_table :enrolls do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end

    # <点赞记录>＝>[用户账户]
    #＃ INFO: rails 没有封装自连接
    create_table :likes do |t|
      t.integer :user1
      t.integer :user2

      t.timestamps
    end
    add_foreign_key :likes, :user, column: :user1
    add_foreign_key :likes, :user, column: :user2

  end
end
