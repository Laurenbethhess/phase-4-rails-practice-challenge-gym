class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships
    attribute :charges

    def charges
        self.memberships.sum{|membership| membership.charge}
    end
end
