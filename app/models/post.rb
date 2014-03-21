# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  content    :text
#  writer_id  :integer
#  published  :boolean          default(FALSE)
#

class Post < ActiveRecord::Base
  has_one :plaza, :as => :postitable, :dependent => :destroy

  validates :title, presence: true
  validates :content, presence: true

  after_create :set_plaza_post

  def set_plaza_post
  	self.create_plaza
  end

end
