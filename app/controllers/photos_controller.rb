class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/index"})
  end

  def show
    the_id = params.fetch("path_id")
    @the_photo = Photo.find("the_id")

    render({ :template => "photo_templates/index"})
  end

  def create
    @the_photo = Photo.new
    @the_photo.image = params.fetch("query_image")
    @the_photo.caption = params.fetch("query_caption")
    @the_photo.owner_id = params.fetch("query_owner_id")

    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos/#{@the_photo.id}", :notice => "Photo created successfully")
    else
      redirect_to("/photos", :notice => "Photo unsuccesfully created ")
    end
  end

end
