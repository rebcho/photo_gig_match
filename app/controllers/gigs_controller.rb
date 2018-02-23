class GigsController < ApplicationController
  def index
    @q = Gig.ransack(params[:q])
    @gigs = @q.result(:distinct => true).includes(:client, :applications, :project_type).page(params[:page]).per(10)

    render("gigs/index.html.erb")
  end

  def show
    @application = Application.new
    @gig = Gig.find(params[:id])

    render("gigs/show.html.erb")
  end

  def new
    @gig = Gig.new

    render("gigs/new.html.erb")
  end

  def create
    @gig = Gig.new

    @gig.client_id = params[:client_id]
    @gig.location = params[:location]
    @gig.title = params[:title]
    @gig.description = params[:description]
    @gig.budget = params[:budget]
    @gig.time_commitment = params[:time_commitment]
    @gig.genre_id = params[:genre_id]
    @gig.sample_images = params[:sample_images]

    save_status = @gig.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gigs/new", "/create_gig"
        redirect_to("/gigs")
      else
        redirect_back(:fallback_location => "/", :notice => "Gig created successfully.")
      end
    else
      render("gigs/new.html.erb")
    end
  end

  def edit
    @gig = Gig.find(params[:id])

    render("gigs/edit.html.erb")
  end

  def update
    @gig = Gig.find(params[:id])

    @gig.client_id = params[:client_id]
    @gig.location = params[:location]
    @gig.title = params[:title]
    @gig.description = params[:description]
    @gig.budget = params[:budget]
    @gig.time_commitment = params[:time_commitment]
    @gig.genre_id = params[:genre_id]
    @gig.sample_images = params[:sample_images]

    save_status = @gig.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gigs/#{@gig.id}/edit", "/update_gig"
        redirect_to("/gigs/#{@gig.id}", :notice => "Gig updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Gig updated successfully.")
      end
    else
      render("gigs/edit.html.erb")
    end
  end

  def destroy
    @gig = Gig.find(params[:id])

    @gig.destroy

    if URI(request.referer).path == "/gigs/#{@gig.id}"
      redirect_to("/", :notice => "Gig deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Gig deleted.")
    end
  end
end
