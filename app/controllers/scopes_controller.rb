class ScopesController < ApplicationController
  def new
    @scope = Scope.new
    @scopes = Scope.paginate(page: params[:page])
  end

  def create
    puts "banana"
    @scope = Scope.new(params[:scope])
    if @scope.save
      flash[:success] = "#{@scope.name} successfully created!"
      redirect_to new_scope_path
    else
      render 'new'
    end
  end
  
  def destroy
    Scope.find(params[:id]).destroy
    flash[:success] = "Scope destroyed."
    redirect_to new_scope_path
  end
end
