module ApplicationHelper
    def alert_class(type)
        case type
        when "notice"
            return "success"
        when "alert"
            return "warning"
        when "error"
            return "danger"
        else
            return "dark"
        end
    end
end
