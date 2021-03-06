class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new
    @author.author_name = params[:author_name]
    @author.author_nationality = params[:author_nationality]
    @author.author_birth_year = params[:author_birth_year]

    if @author.save
      redirect_to "/authors", :notice => "Author created successfully."
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    @author.author_name = params[:author_name]
    @author.author_nationality = params[:author_nationality]
    @author.author_birth_year = params[:author_birth_year]

    if @author.save
      redirect_to "/authors", :notice => "Author updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy

    redirect_to "/authors", :notice => "Author deleted."
  end
end
