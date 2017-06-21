class OrangesController < ApplicationController
  def index
    @q = Orange.ransack(params[:q])
    @oranges = @q.result(:distinct => true).page(params[:page]).per(10)

    render("oranges/index.html.erb")
  end

  def show
    @orange = Orange.find(params[:id])

    render("oranges/show.html.erb")
  end

  def new
    @orange = Orange.new

    render("oranges/new.html.erb")
  end

  def create
    @orange = Orange.new

    @orange.description = params[:description]

    save_status = @orange.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/oranges/new", "/create_orange"
        redirect_to("/oranges")
      else
        redirect_back(:fallback_location => "/", :notice => "Orange created successfully.")
      end
    else
      render("oranges/new.html.erb")
    end
  end

  def edit
    @orange = Orange.find(params[:id])

    render("oranges/edit.html.erb")
  end

  def update
    @orange = Orange.find(params[:id])

    @orange.description = params[:description]

    save_status = @orange.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/oranges/#{@orange.id}/edit", "/update_orange"
        redirect_to("/oranges/#{@orange.id}", :notice => "Orange updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Orange updated successfully.")
      end
    else
      render("oranges/edit.html.erb")
    end
  end

  def destroy
    @orange = Orange.find(params[:id])

    @orange.destroy

    if URI(request.referer).path == "/oranges/#{@orange.id}"
      redirect_to("/", :notice => "Orange deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Orange deleted.")
    end
  end
end
