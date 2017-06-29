module ApplicationHelper
  def full_title page_title = ""
    base_title = t("static_pages.title_page_general")
    page_title.empty? ? base_title : page_title + t("vertical_bar") + base_title
  end
end
