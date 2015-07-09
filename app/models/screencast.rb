class Screencast < ActiveRecord::Base
	validates_presence_of :title, :summary, :duration, :link, :published_at, :source, :video_url
  validates_uniqueness_of :video_url

  has_many :comments
  def as_json(options={})
    super(:include => [:comments])
  end
end
