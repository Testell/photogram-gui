class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :created_at => :desc})

    render({ :template => "user_templates/index"})
  end

  def show
    the_username = params.fetch("username")
    @the_user = User.find_by(username: the_username)

    render({ :template => "user_templates/show"})
  end  

  def create 
    @the_user = User.new
    @the_user.username = params.fetch("query_user_name")
  
    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User created succesfully"})
    else
      redirect_to("/users", { :notice => "User failed to create successfully"})
    end
  end

  def update
    the_username = params.fetch("username")
    @the_user = User.find_by(username: the_username)

    @the_user.username = params.fetch("query_user_name")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User updated successfully"})
    else
      redirect_to("/users/#{@the_user.username}", { :notice => "User failed to update successfully"})
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_user = User.find(the_id)

    @the_user.destroy

    redirect_to("/users", { :notice => "User deleted successfully"})
  end
end
