class GenresController < ApplicationController
  def index
    @genres = Genre.all

    render("genres/index.html.erb")
  end

  def show
    @genre = Genre.find(params[:id])

    render("genres/show.html.erb")
  end

  def new
    @genre = Genre.new

    render("genres/new.html.erb")
  end

  def create
    @genre = Genre.new

    @genre.name = params[:name]

    save_status = @genre.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/genres/new", "/create_genre"
        redirect_to("/genres")
      else
        redirect_back(:fallback_location => "/", :notice => "Genre created successfully.")
      end
    else
      render("genres/new.html.erb")
    end
  end

  def edit
    @genre = Genre.find(params[:id])

    render("genres/edit.html.erb")
  end

  def update
    @genre = Genre.find(params[:id])

    @genre.name = params[:name]

    save_status = @genre.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/genres/#{@genre.id}/edit", "/update_genre"
        redirect_to("/genres/#{@genre.id}", :notice => "Genre updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Genre updated successfully.")
      end
    else
      render("genres/edit.html.erb")
    end
  end

  def destroy
    @genre = Genre.find(params[:id])

    @genre.destroy

    if URI(request.referer).path == "/genres/#{@genre.id}"
      redirect_to("/", :notice => "Genre deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Genre deleted.")
    end
  end
end
