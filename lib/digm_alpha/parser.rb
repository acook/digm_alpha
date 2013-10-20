require 'treetop'
require_relative 'parser/node_extensions'

class DigmAlpha::Parser
  class << self
    def parser reload = false
      return @parser if !reload && @parser

      grammar_file = 'lib/digm_alpha/parser/digm_alpha_parser.treetop'
      Treetop.load grammar_file
      @parser = DigmAlpha::DigmAlphaGrammarParser.new
    end

    def parse data
      tree = parser.parse(data)

      if tree then
        tree
      else
        raise Exception, "Parse error at offset: #{parser.index}, because of: #{parser.failure_reason}"
      end
    end

    protected

    def clean_tree root_node
      return if root_node.elements.nil?

      root_node.elements.delete_if do |node|
        node.is_a? Treetop::Runtime::SyntaxNode
      end

      root_node.elements.each do |node|
        self.clean_tree(node)
      end
    end
  end
end
