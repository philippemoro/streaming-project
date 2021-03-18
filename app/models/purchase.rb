# frozen_string_literal: true

# == Schema Information
#
# Table name: purchases
#
#  id                 :uuid             not null, primary key
#  expires_at         :datetime
#  price              :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  purchase_option_id :uuid
#  user_id            :uuid
#
# Indexes
#
#  index_purchases_on_purchase_option_id  (purchase_option_id)
#  index_purchases_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purchase_option_id => purchase_options.id)
#
class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  delegate :purchasable, to: :purchase_option, allow_nil: false

  validates :price, numericality: { greater_than_or_equal_to: 0.0 }
  validate :content_already_purchased, on: :create

  after_create :set_expire_date

  scope :alive, -> { where('expires_at > ?', Time.zone.now) }

  def set_expire_date
    return if expires_at

    update_column(:expires_at, created_at + 2.days)
  end

  def content_already_purchased
    return unless user && user.alive_purchases.includes(purchase_option: :content)
                              .where(purchase_options: { content: purchase_option&.content })
                              .references(:purchase_options, :contents).exists?

    errors.add(:content, 'already purchased')
  end
end
