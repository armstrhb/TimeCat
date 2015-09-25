module ApplicationHelper
  def render_markdown(text)
    if text == nil
      text = ""
    end

    renderer = Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})

    markdown.render(text).html_safe
  end

  def trim_to_suit(text, length = 200)
    if text == nil
      text = ""
    end

    if text.length < 200
      return text
    else
      return text[0..length] + "... (#{text.length - length} more characters)"
    end
  end

  def discover_universe()
    if @universe != nil
      @universe
    else
      nil
    end
  end
end
