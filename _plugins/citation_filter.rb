require 'bibtex'
require 'liquid'

module Jekyll
  module CitationFilter
    def citation_links(content)
      site = @context.registers[:site]
      bibliography_path = File.join(site.source, '_bibliography', 'references.bib')
      
      return content unless File.exist?(bibliography_path)
      
      begin
        bib = BibTeX.open(bibliography_path)
        
        # Extract all citation keys from the content
        citation_keys = content.scan(/\[([a-zA-Z0-9_]+)\]/).flatten.uniq
        
        # Create a mapping from citation key to reference number
        key_to_number = {}
        citation_keys.each_with_index do |key, index|
          key_to_number[key] = index + 1
        end
        
        # Replace [key] with numbered citations
        content.gsub(/\[([a-zA-Z0-9_]+)\]/) do |match|
          key = $1
          if key_to_number.key?(key)
            "<a href=\"#ref-#{key}\" class=\"citation\">[#{key_to_number[key]}]</a>"
          else
            match # Keep original if not found
          end
        end
      rescue => e
        puts "Citation filter error: #{e.message}"
        content # Return original content if error
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::CitationFilter) 