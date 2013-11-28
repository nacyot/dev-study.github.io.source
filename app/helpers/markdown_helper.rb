module MarkdownHelper
  def markdown_engine
    Redcarpet::Markdown.new(HTMLwithPygments,
                            :autolink => true,
                            :space_after_headers => true,
                            :fenced_code_blocks => true,
                            :strikethrough => true,
                            :space_after_headers => false,
                            :underline => false                            
                            )
    
  end
end

class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, :lexer => language)
  end
end
