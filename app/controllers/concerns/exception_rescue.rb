module ExceptionRescue
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from Api::Errors::Forbidden,       with: :render_403

    def render_403(ex)
      Rollbar.send(:info, ex, {})
      respond_to do |f|
        f.json { render json: {message: "Forbidden"}, status: :forbidden }
        f.html { render "pages/page_403", layout: "application", status: :forbidden }
      end
    end

    def render_404(ex)
      Rollbar.send(:info, ex, {})
      respond_to do |f|
        f.json { render json: {message: "Not Found"}, status: :not_found }
        f.html { render "pages/page_404", layout: "application", status: :not_found }
      end
    end
  end
end