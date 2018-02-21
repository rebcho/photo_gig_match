class ReviewsController < ApplicationController
  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:photographer, :client).page(params[:page]).per(10)

    render("reviews/index.html.erb")
  end

  def show
    @review = Review.find(params[:id])

    render("reviews/show.html.erb")
  end

  def new
    @review = Review.new

    render("reviews/new.html.erb")
  end

  def create
    @review = Review.new

    @review.photographer_id = params[:photographer_id]
    @review.client_id = params[:client_id]
    @review.rating = params[:rating]
    @review.comment = params[:comment]
    @review.gig_id = params[:gig_id]
    @review.reviewer = params[:reviewer]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/new", "/create_review"
        redirect_to("/reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "Review created successfully.")
      end
    else
      render("reviews/new.html.erb")
    end
  end

  def edit
    @review = Review.find(params[:id])

    render("reviews/edit.html.erb")
  end

  def update
    @review = Review.find(params[:id])

    @review.photographer_id = params[:photographer_id]
    @review.client_id = params[:client_id]
    @review.rating = params[:rating]
    @review.comment = params[:comment]
    @review.gig_id = params[:gig_id]
    @review.reviewer = params[:reviewer]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/#{@review.id}/edit", "/update_review"
        redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review updated successfully.")
      end
    else
      render("reviews/edit.html.erb")
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    if URI(request.referer).path == "/reviews/#{@review.id}"
      redirect_to("/", :notice => "Review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review deleted.")
    end
  end
end
