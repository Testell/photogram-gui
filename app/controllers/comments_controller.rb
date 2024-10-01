class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all
    @list_of_comments = matching_comments.order({ :created_at => :desc })

    render({ :template => "/photo_templates/show"})
  end

  def create
    @the_comment = Comment.new
    @the_comment.photo_id = params.fetch("query_photo_id")
    @the_comment.author_id = params.fetch("query_author_id")
    @the_comment.body = params.fetch("query_comment_body")

    if @the_comment.valid?
      @the_comment.save
      redirect_to("/photos/#{@the_comment.photo_id}", :notice => "Comment created successfully")
    else
      redirect_to("/photos/#{@the_comment.photo_id}", :notice => "Comment unsuccesfully created ")
    end
  end

  def update
    the_id = params.fetch(":path_id")
    @the_comment = Comment.find_by(username: the_username)

    @the_user.username = params.fetch("query_user_name")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User updated successfully"})
    else
      redirect_to("/users/#{@the_user.username}", { :notice => "User failed to update successfully"})
    end
  end
end
