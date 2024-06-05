class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を入力してください' } do
    validates :first_name, message: '全角文字を入力してください'
    validates :last_name, message: '全角文字を入力してください'
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角カタカナを入力してください' } do
    validates :first_name_kana, message: '全角カタカナを入力してください'
    validates :last_name_kana, message: '全角カタカナを入力してください'
  end
end
