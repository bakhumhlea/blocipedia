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
    
    def find_cols_in(wiki)
        User.where(id: wiki.collaborators.pluck(:user_id))
    end
    def find_user_in(collaborator_user_id)
        User.find(collaborator_user_id)
    end
    
end
