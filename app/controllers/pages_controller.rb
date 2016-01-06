class PagesController < ApplicationController
  before_action :set_branches, only: [:home, :products]

  def home
  end
  def about
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
end
