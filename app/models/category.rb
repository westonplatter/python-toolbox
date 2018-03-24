# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#
# Indexes
#
#  index_categories_on_lft        (lft)
#  index_categories_on_parent_id  (parent_id)
#  index_categories_on_rgt        (rgt)
#

class Category < ApplicationRecord
  acts_as_nested_set

  has_many :category_packages
  has_many :packages, through: :category_packages
end
