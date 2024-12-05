module ApplicationHelper
    def show_header?
        # ヘッダーを表示する条件を記述
        controller_name != "sessions" && controller_name != "registrations"
    end
end
