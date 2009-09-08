require 'httparty'

module ESV
  class Bible
    include HTTParty
    
    base_uri 'http://www.esvapi.org/v2/rest/'
    
    # The ESV API requires a key that can be passed in as one of the options, :key => 'value'.  By default, it is 'IP'
    def initialize(default_options={})
      @default_options = default_options
      @default_options[:key] ||= 'IP'
    end

    # Lookup a passage
    # 
    # See http://www.esvapi.org/api for more information and options
    def passage_query(passage, options={})
      options[:passage] = passage
      self.class.get '/passageQuery', :query => @default_options.merge(options)
    end
    
    # Look up a passage or show word-search results, depending on the query
    # 
    # The output format is always HTML.
    # 
    # See http://www.esvapi.org/api for more information and options
    def query(q, options={})
      options[:q] = q
      self.class.get '/query', :query => @default_options.merge(options)
    end
    
    # Parse and display information about your query, including identify whether it is a passage reference or a word search
    # 
    # See http://www.esvapi.org/api for more information and options
    def query_info(q)
      options = {:q => q}
      self.class.get '/queryInfo', :query =>  @default_options.merge(options)
    end

    # Display a random verse from a preselected list, or specify verse(s)
    # 
    # See http://www.esvapi.org/api for more information and options
    def verse(options={})
      self.class.get '/verse', :query => @default_options.merge(options)
    end

    # Display a verse that changes every day
    # 
    # See http://www.esvapi.org/api for more information and options
    def daily_verse(options={})
      self.class.get '/dailyVerse', :query => @default_options.merge(options)
    end
  end
end