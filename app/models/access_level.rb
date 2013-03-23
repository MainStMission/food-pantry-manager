class AccessLevel < ActiveRecord::Base
    def self.admin
        AccessLevel.where(name: "Admin")
    end
    def self.super_volunteer
        AccessLevel.where(name: "Super-Volunteer")
    end
    def <=>(other)
        self.level <=> other.level
    end
end
