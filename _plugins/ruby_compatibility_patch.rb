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
      
      # Override replace method to handle Array objects properly
      def replace(entries)
        case entries
        when Array
          @entries = entries.map { |entry| entry.is_a?(Entry) ? entry : Entry.new(entry) }
        when Hash
          @entries = [Entry.new(entries)]
        when Entry
          @entries = [entries]
        else
          @entries = []
        end
        self
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
    
    class Entry
      # Add safe match? method for Entry objects
      def match?(query)
        if query.is_a?(Regexp)
          to_s.match?(query)
        elsif query.is_a?(String)
          to_s.include?(query)
        else
          false
        end
      end
    end
  end
  
  # Monkey patch Array to add match? method if it doesn't exist
  unless Array.instance_methods.include?(:match?)
    class Array
      def match?(query)
        if query.is_a?(Regexp)
          any? { |item| item.to_s.match?(query) }
        elsif query.is_a?(String)
          any? { |item| item.to_s.include?(query) }
        else
          false
        end
      end
    end
  end
end 