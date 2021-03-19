# frozen_string_literal: true

user1 = FactoryBot.create(:user)
user2 = FactoryBot.create(:user)
_user1_purchases = FactoryBot.create_list(:purchase, 10, user: user1)
_user1_expired_purchases = FactoryBot.create_list(:expired_purchase, 10, user: user1)
_user2_purchases = FactoryBot.create_list(:purchase, 15, user: user2)
_user2_expired_purchases = FactoryBot.create_list(:expired_purchase, 15, user: user2)
_seaons_with_episodes = FactoryBot.create_list(:season, 10, :with_episodes)
