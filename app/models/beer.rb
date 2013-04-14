class Beer < ActiveRecord::Base
  include Permalinkable
  include Socialable

  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :breweries
  belongs_to :style

  before_destroy { ingredients.clear and breweries.clear }

  def self.paginate(options = {})
    page(options[:page]).per(options[:per_page])
  end
end
