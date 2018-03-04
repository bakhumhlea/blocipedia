module WikisHelper
    
    def markdown(content)
        input = content ||= ""
        renderer = Redcarpet::Render::HTML.new({no_links: true, hard_wrap: true})
        markdown = Redcarpet::Markdown.new(renderer, {autolink: true,
                                                              no_intra_emphasis: true, 
                                                              fenced_code_blocks: true, 
                                                              highlight: true,
                                                              quote: true,
                                                              underline: true}
                                                              )
        markdown.render(input).html_safe
    end
end
