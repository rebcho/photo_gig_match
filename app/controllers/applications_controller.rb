class ApplicationsController < ApplicationController
  def index
    @q = Application.ransack(params[:q])
    @applications = @q.result(:distinct => true).includes(:photographer, :gig).page(params[:page]).per(10)

    render("applications/index.html.erb")
  end

  def show
    @application = Application.find(params[:id])

    render("applications/show.html.erb")
  end

  def new
    @application = Application.new

    render("applications/new.html.erb")
  end

  def create
    @application = Application.new

    @application.gig_id = params[:gig_id]
    @application.photographer_id = params[:photographer_id]

    save_status = @application.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/applications/new", "/create_application"
        redirect_to("/applications")
      else
        redirect_back(:fallback_location => "/", :notice => "Application created successfully.")
      end
    else
      render("applications/new.html.erb")
    end
  end

  def edit
    @application = Application.find(params[:id])

    render("applications/edit.html.erb")
  end

  def update
    @application = Application.find(params[:id])

    @application.gig_id = params[:gig_id]
    @application.photographer_id = params[:photographer_id]

    save_status = @application.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/applications/#{@application.id}/edit", "/update_application"
        redirect_to("/applications/#{@application.id}", :notice => "Application updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Application updated successfully.")
      end
    else
      render("applications/edit.html.erb")
    end
  end

  def destroy
    @application = Application.find(params[:id])

    @application.destroy

    if URI(request.referer).path == "/applications/#{@application.id}"
      redirect_to("/", :notice => "Application deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Application deleted.")
    end
  end
end
