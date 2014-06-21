require_relative '../../config/application'

class Tag < ActiveRecord::Base
  belongs_to :post
  	def self.filter_for_tag(requested_tag)
  		Tag.where("tag = ?", requested_tag).map do |tag|
      		[tag.post.title, tag.post.content, tag.post.tags.pluck(:tag)]
    	end	  	
	end
end

