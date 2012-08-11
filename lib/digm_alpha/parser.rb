require 'treetop'
require_relative 'parser/node_extensions'

class DigmAlpha::Parser
  def parser reload
    return @parser if !reload && @parser

    grammar_file = File.join base_path, 'digm_alpha_parser.treetop'
    Treetop.load grammar_file
    @parser = DigmAlphaParser.new
  end

  def self.parse data
    tree = parser.parse(data)

    if tree then
      tree
    else
      raise Exception, "Parse error at offset: #{parser.index}"
    end
  end
end
