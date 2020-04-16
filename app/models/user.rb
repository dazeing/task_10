class User < ApplicationRecord
  belongs_to :team

  validates_presence_of :name, :phone, :male

  scope :search_by_name, -> (text) {where("name LIKE ?", "%#{text}%")}

  def self.search(params)
      users = User.all
      if params
          users = users.search_by_name(params[:text])
      end

      return users
  end
end
