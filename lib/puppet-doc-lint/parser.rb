class PuppetDocLint
  class Parser

    def initialize(file)
      # Read file and return parsed object
      pparser         = Puppet::Parser::Parser.new('production')
      if File.exists?(file)
        @file = File.expand_path(file)
        pparser.import(@file)

        # Find object in list of hostclasses
        pparser.environment.known_resource_types.hostclasses.each do |x|
          @object = x.last if x.last.file == @file
        end
        # Find object in list of definitions
        pparser.environment.known_resource_types.definitions.each do |x|
          @object = x.last if x.last.file == @file
        end

      else
        'File does not exist'
      end
    end

    # Read parameters from parsed object, returns hash of parameters and default
    # values
    def parameters
      result = (defined? @object.arguments) ? @object.arguments : {}
      result
    end

    # Read class from parsed object, returns string containing class
    def klass
      @object.name if (defined? @object.class.name)
    end

    # Read RDOC contents from parsed object, returns hash of paragraph headings
    # and the following paragraph contents
    #(i.e. parameter and parameter documentation)
    def docs
      if !@object.doc.nil?
        rdoc            = RDoc::Markup.parse(@object.doc)
        docs            = {}

        rdoc.parts.each do |part|
          if part.respond_to?(:items)
            part.items.each do |item|
              next if item.label.nil?
              key       = item.label.to_s.tr('^A-Za-z0-9_-', '')
              docs[key] = item.parts.first.parts
            end # do item
          end # endif
        end # do parm
        docs
      end # if nil?
    end # def docs

    def authors
      if !@object.doc.nil?
        rdoc            = RDoc::Markup.parse(@object.doc)
        authors         = []

        author_docs = rdoc.parts.chunk{|i|i.class == RDoc::Markup::Heading && i.text == 'Authors'}.reject{|sep,ans| sep}.map{|sep,ans| ans}

        author_docs.each do | doc_chunk |
          unless doc_chunk[1].class == RDoc::Markup::BlankLine || doc_chunk[1].class == RDoc::Markup::Heading
            doc_chunk[1].parts.each do |chunk|
              authors << chunk
            end
          end
        end

        authors
      end # if nil?
    end # def authors
  end # class Parser
end # module PuppetDocLint
