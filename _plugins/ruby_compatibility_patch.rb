# Ruby 3.4 compatibility patch for bibtex-ruby
# This patch fixes the "tried to create Proc object without a block" error and match? method issues

if RUBY_VERSION >= "3.4.0"
  require 'bibtex'
  
  module BibTeX
    class Bibliography
      # Override the problematic method
      def each(&block)
        if block_given?
          @entries.each(&block)
        else
          @entries.each
        end
      end
      
      # Fix match? method for Array compatibility
      def query(q, &block)
        filter = block ? proc { |e| safe_match?(e, q) && block.call(e) } :
                        proc { |e| safe_match?(e, q) }
        select(&filter)
      end
      
      private
      
      def safe_match?(entry, query)
        if entry.respond_to?(:match?)
          entry.match?(query)
        elsif entry.respond_to?(:to_s)
          entry.to_s.match?(query)
        else
          false
        end
      end
    end
  end
end 