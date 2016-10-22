class Comment < ApplicationRecord
	belongs_to :comment
	has_many :comments, :class_name => "Comment", :foreign_key => "post_id"
	scope :threads, -> { where("post_id IS NULL") }
	def textMarkup
		ret = []
		self.text.split("\n").each do |line|
			if line[0] == '>'
				ret.push "<span class='quote'>"+line+"</span>"
			else
				ret.push "<span>"+line+"</span>"
			end
		end
		ret.join("<br />")
	end
end
