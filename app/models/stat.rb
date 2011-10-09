class Stat < ActiveRecord::Base
end


# == Schema Information
#
# Table name: stats
#
#  id      :integer         not null, primary key
#  post_id :integer
#  month   :integer
#  year    :integer
#  visits  :integer         default(0)
#
# Indexes
#
#  index_stats_on_month    (month)
#  index_stats_on_post_id  (post_id)
#  index_stats_on_visits   (visits)
#  index_stats_on_year     (year)
#

