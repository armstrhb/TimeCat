module ApplicationHelper
  def render_markdown(text)
    if text == nil
      text = ""
    end

    renderer = Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})

    markdown.render(text).html_safe
  end
end
