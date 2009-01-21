class Site < ActiveRecord::Base
  has_many :posts, :as => :blog
end
