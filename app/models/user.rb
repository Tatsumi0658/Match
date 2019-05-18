class User < ApplicationRecord
  #before_validation:{ email.dowmcase! }
  enum sex: { male: 0, female: 1 }
  enum birth: { Hokkaido: 1, Aomori: 2, Iwate: 3, Miyagi: 4, Akita: 5, Ymagata: 6, Fukushima: 7,
    Ibaraki: 8, Tochigi: 9, Gunma: 10, Saitama: 11, Chiba: 12, Tokyo: 13, Kanagawa: 14,
    Nigata: 15, Toyama: 16, Ishikawa: 17, Fukui: 18, Yamanashi: 19, Nagano: 20,
    Gifu: 21, Shizuoka: 22, Aichi: 23, Mie: 24,
    Shiga: 25, Kyoto: 26, Osaka: 27, Hyogo: 28, Nara: 29, Wakayama: 30,
    Tottori: 31, Shimane: 32, Okayama: 33, Hiroshima: 34, Yamaguchi: 35,
    Tokushima: 36, Kagawa: 37, Ehime: 38, Kouchi: 39,
    Fukuoka: 40, Saga: 41, Nagasaki: 42, Kumamoto: 43, Oita: 44, Miyazaki: 45, Kagoshima: 46, Okinawa: 47 }
  enum status:{ alone: 0, married: 1, divorce: 2 }

  validates :name, presence: true, length:{ in:1..10 }
  validates :age, presence: true, format:{ with: /\A\d{2}/ }
  validates :sex, presence: true
  validates :email ,presence: true, uniqueness: true, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_secure_password
  validates :password, presence: true, length:{ minimum: 6 }

  has_many :active_relationships, foreign_key: 'follow_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
