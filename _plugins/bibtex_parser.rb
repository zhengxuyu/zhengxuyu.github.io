require 'bibtex'
require 'liquid'

module Jekyll
  class BibtexParser < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @markup = markup.strip
    end

    def render(context)
      site = context.registers[:site]
      bibliography_path = File.join(site.source, '_bibliography', 'references.bib')
      
      return "Bibliography file not found" unless File.exist?(bibliography_path)
      
      begin
        bib = BibTeX.open(bibliography_path)
        
        # Get all citation keys from the content
        page = context.registers[:page]
        content = page['content'] || ''
        citation_keys = extract_citation_keys(content)
        
        # Filter references to only include cited ones
        references = []
        citation_keys.each do |key|
          entry = bib[key]
          if entry
            references << format_reference(entry, key)
          end
        end
        
        if references.empty?
          return "<p>No references found.</p>"
        end
        
        # Generate references without outer numbering
        references_html = references.map do |ref|
          "<li id=\"ref-#{ref[:key]}\">#{ref[:formatted]}</li>"
        end.join("\n")
        
        "<ol class=\"references\">\n#{references_html}\n</ol>"
      rescue => e
        "Error parsing bibliography: #{e.message}"
      end
    end

    private

    def extract_citation_keys(content)
      # Extract citation keys from [key] format
      content.scan(/\[([a-zA-Z0-9_]+)\]/).flatten.uniq
    end

    def extract_year(date_field)
      return nil unless date_field
      
      if date_field.respond_to?(:year)
        date_field.year
      elsif date_field.respond_to?(:to_s)
        # Try to extract year from string
        year_match = date_field.to_s.match(/(\d{4})/)
        year_match ? year_match[1] : nil
      else
        nil
      end
    end

    def safe_get(entry, field)
      entry.respond_to?(field) ? entry.send(field) : nil
    end

    def format_reference(entry, key)
      case entry.type.to_s
      when 'article'
        format_article(entry)
      when 'inproceedings'
        format_inproceedings(entry)
      when 'incollection'
        format_incollection(entry)
      when 'thesis'
        format_thesis(entry)
      else
        format_generic(entry)
      end
    end

    def format_article(entry)
      authors = format_authors(safe_get(entry, 'author'))
      journal = safe_get(entry, 'journaltitle') || safe_get(entry, 'journal') || ''
      volume = safe_get(entry, 'volume') ? ", vol. #{safe_get(entry, 'volume')}" : ""
      number = safe_get(entry, 'number') ? ", no. #{safe_get(entry, 'number')}" : ""
      pages = safe_get(entry, 'pages') ? ", pp. #{safe_get(entry, 'pages')}" : ""
      year = extract_year(safe_get(entry, 'date')) ? ", #{extract_year(safe_get(entry, 'date'))}" : ""
      doi = safe_get(entry, 'doi') ? ". doi: #{safe_get(entry, 'doi')}" : ""
      
      { key: entry.key, formatted: "#{authors}, \"#{safe_get(entry, 'title')},\" <em>#{journal}</em>#{volume}#{number}#{pages}#{year}#{doi}." }
    end

    def format_inproceedings(entry)
      authors = format_authors(safe_get(entry, 'author'))
      booktitle = safe_get(entry, 'booktitle') || ''
      organization = safe_get(entry, 'organization') ? ", #{safe_get(entry, 'organization')}" : ""
      pages = safe_get(entry, 'pages') ? ", pp. #{safe_get(entry, 'pages')}" : ""
      year = extract_year(safe_get(entry, 'date')) ? ", #{extract_year(safe_get(entry, 'date'))}" : ""
      
      { key: entry.key, formatted: "#{authors}, \"#{safe_get(entry, 'title')},\" in <em>#{booktitle}</em>#{organization}#{pages}#{year}." }
    end

    def format_incollection(entry)
      authors = format_authors(safe_get(entry, 'author'))
      booktitle = safe_get(entry, 'booktitle') || ''
      publisher = safe_get(entry, 'publisher') ? ", #{safe_get(entry, 'publisher')}" : ""
      pages = safe_get(entry, 'pages') ? ", pp. #{safe_get(entry, 'pages')}" : ""
      year = extract_year(safe_get(entry, 'date')) ? ", #{extract_year(safe_get(entry, 'date'))}" : ""
      
      { key: entry.key, formatted: "#{authors}, \"#{safe_get(entry, 'title')},\" in <em>#{booktitle}</em>#{publisher}#{pages}#{year}." }
    end

    def format_thesis(entry)
      authors = format_authors(safe_get(entry, 'author'))
      institution = safe_get(entry, 'institution') || ''
      year = extract_year(safe_get(entry, 'date')) ? ", #{extract_year(safe_get(entry, 'date'))}" : ""
      
      { key: entry.key, formatted: "#{authors}, \"#{safe_get(entry, 'title')},\" #{institution}#{year}." }
    end

    def format_generic(entry)
      authors = format_authors(safe_get(entry, 'author'))
      title = safe_get(entry, 'title') || ''
      year = extract_year(safe_get(entry, 'date')) ? ", #{extract_year(safe_get(entry, 'date'))}" : ""
      
      { key: entry.key, formatted: "#{authors}, \"#{title}\"#{year}." }
    end

    def format_authors(author_field)
      return "Unknown Author" unless author_field
      
      authors = author_field.to_s.split(' and ')
      if authors.length > 3
        first_author = authors[0].split(', ')[0]
        "#{first_author} et al."
      else
        authors.map { |a| a.split(', ')[0] }.join(', ')
      end
    end
  end
end

Liquid::Template.register_tag('bibtex_references', Jekyll::BibtexParser) 