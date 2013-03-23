module AccessLevelHelper
    def super_volunteer
        @access_level >= AccessLevel.super_volunteer  
    end

    def admin
        @access_level == AccessLevel.admin
    end
end
