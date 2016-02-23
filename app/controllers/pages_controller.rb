class PagesController < ApplicationController
  before_action :set_branches, only: [:home, :branches]
  before_action :set_branch, only: [:products]

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
    @articles = Article.all
  end
  def news_article
    @article = Article.friendly.find(params[:article_id])
  end
  def contact
  end

  private
    def set_branches
      @branches = Branch.all
    end

    def set_branch
      @branch = Branch.friendly.find(params[:branch_id])
    end
end
