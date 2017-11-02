class PagesController < ApplicationController
  before_action :set_branches, only: [:home, :branches]
  before_action :set_branch, only: [:products]
  layout 'welcome', only: :welcome

  def home
    @articles = Article.order("RAND()").take(4)
  end

  def about
  end

  def branches
  end

  def products
  	if request.post?
  		render @branch.products
  	end
  end

  def awards
  end

  def news
    @articles = Article.order(updated_at: :desc)
  end

  def news_article
    @article = Article.friendly.find(params[:article_id])
  end

  def contact
  end

  def welcome
    if request.post?
      if params[:full_age].present? and params[:full_age] == 'true'
        cookies.signed[:full_age] = true
        redirect_to root_path
      end
    end
  end

  private
    def set_branches
      @branches = Branch.order(position: :asc)
    end

    def set_branch
      @branch = Branch.friendly.find(params[:branch_id])
    end
end
