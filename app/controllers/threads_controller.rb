class ThreadsController < ApplicationController
	def index
		# @threads = Comment.where(is_post: true)
		# @threads = @topic.posts.page(params[:page]).per(2)
		@threads = Comment.where("post_id IS NULL").page(params[:page]).per(20)
		# paginate json: threads.as_json(
		# 	# :only => [:title, :description, :author,],
		# 	# :methods => [:picture_medium, :friendly_id]
		# )
	end
end
