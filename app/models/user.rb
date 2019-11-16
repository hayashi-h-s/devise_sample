class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  #likesを変数のように使用できる
  #userが削除された時、 posts,likeを全て削除する
  has_many :liked_posts, through: :likes, source: :post
  #has_many :through関連付けは、他方のモデルと「多対多」のつながりを設定する場合によく使われます。
  # https://railsguides.jp/association_basics.html#has-many-through%E9%96%A2%E9%80%A3%E4%BB%98%E3%81%91
  #liked_postsによってuserがどの投稿をいいねしているのかを簡単に取得できるようになります。
  #current_user.liked_posts.count　のように簡単に表示できる
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  #exists?はデータが存在するかどうか知りたい時
  #取得したデータのカラムに値が存在するか知りたい時(nil?)
  #ユーザーが投稿に対して、すでにいいねをしているのかどうかを判定することができる
end
