class String
  def integer?
    Integer(self)
    return true
  rescue ArgumentError
    return false
  end
end

class Comment < ApplicationRecord
	belongs_to :comment
	has_many :comments, :class_name => "Comment", :foreign_key => "post_id"
	scope :threads, -> { where("post_id IS NULL") }
	def textMarkup
		ret = []
		self.text.split("\n").each do |line|
			if line[0..1] == '>>' && line[2..9].integer?
				ret.push "<a href='##{line[2..9]}' class='quotelink'>#{line}</a>"
			elsif line[0] == '>'
				ret.push "<span class='quote'>#{line}</span>"
			else
				ret.push "<span>#{line}</span>"
			end
		end
		ret.join("<br />")
	end
end
