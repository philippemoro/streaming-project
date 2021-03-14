# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_314_141_410) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'episodes', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'title'
    t.string 'plot'
    t.integer 'number'
    t.uuid 'season_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['season_id'], name: 'index_episodes_on_season_id'
  end

  create_table 'movies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'title'
    t.string 'plot'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'purchase_options', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.decimal 'price'
    t.string 'quality'
    t.string 'purchasable_type'
    t.uuid 'purchasable_id'
    t.uuid 'purchase_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[purchasable_type purchasable_id], name: 'index_purchase_options_on_purchasable_type_and_purchasable_id'
    t.index ['purchase_id'], name: 'index_purchase_options_on_purchase_id'
  end

  create_table 'purchases', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.uuid 'user_id'
    t.index ['user_id'], name: 'index_purchases_on_user_id'
  end

  create_table 'seasons', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'title'
    t.string 'plot'
    t.integer 'number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'episodes', 'seasons'
end
