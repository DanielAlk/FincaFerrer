class PagesController < ApplicationController
  before_action :set_branches, only: [:home, :branches]
  before_action :set_branch, only: [:products]

  def home
  end
  def about
  end
  def branches
  end
  def products
  end
  def awards
  end
  def news
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
