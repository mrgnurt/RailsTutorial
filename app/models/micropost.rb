class Micropost < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.content_max_length}
  validate :picture_size

  scope :newest_first, -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader

  private

  def picture_size
    errors.add :picture, I18n.t("less_than_5MB") if picture.size > 5.megabytes
  end
end
