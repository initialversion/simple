class ApplesController < ApplicationController
  def index
    @apples = Apple.all

    render("apples/index.html.erb")
  end

  def show
    @apple = Apple.find(params[:id])

    render("apples/show.html.erb")
  end

  def new
    @apple = Apple.new

    render("apples/new.html.erb")
  end

  def create
    @apple = Apple.new

    @apple.name = params[:name]

    save_status = @apple.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/apples/new", "/create_apple"
        redirect_to("/apples")
      else
        redirect_back(:fallback_location => "/", :notice => "Apple created successfully.")
      end
    else
      render("apples/new.html.erb")
    end
  end

  def edit
    @apple = Apple.find(params[:id])

    render("apples/edit.html.erb")
  end

  def update
    @apple = Apple.find(params[:id])

    @apple.name = params[:name]

    save_status = @apple.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/apples/#{@apple.id}/edit", "/update_apple"
        redirect_to("/apples/#{@apple.id}", :notice => "Apple updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Apple updated successfully.")
      end
    else
      render("apples/edit.html.erb")
    end
  end

  def destroy
    @apple = Apple.find(params[:id])

    @apple.destroy

    if URI(request.referer).path == "/apples/#{@apple.id}"
      redirect_to("/", :notice => "Apple deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Apple deleted.")
    end
  end
end
