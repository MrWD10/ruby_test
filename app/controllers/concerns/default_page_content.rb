module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults

    end

    def set_page_defaults
        @page_title="TestApp"
        @seo_keywords = "Portfolio"
    end

end