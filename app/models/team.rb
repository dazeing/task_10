class Team < ApplicationRecord
    has_many :users,  dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates :region, presence: true

    scope :search_by_name, -> (text) {where("name LIKE ?", "%#{text}%")}
    scope :search_by_region, -> (text) {where("region LIKE ?", "%#{text}%")}


    def self.search(params)
        teams = Team.all
        if params
            teams = teams.search_by_name(params[:text]) if params[:name].present?
            teams = teams.or(search_by_region(params[:text])) if params[:region].present?
        end

        return teams
    end
end
