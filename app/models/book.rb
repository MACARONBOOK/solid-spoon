class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :body, presence: true

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.pncdg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit:[width, height]).processed
  end

end
