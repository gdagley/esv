require 'httparty'

module ESV
  class ReadingPlan
    include HTTParty
    
    base_uri 'http://www.esvapi.org/v2/rest/'
    
    # The ESV API requires a key that can be passed in as one of the options, :key => 'value'.  By default, it is 'IP'
    def initialize(default_options={})
      @default_options = default_options
      @default_options[:key] ||= 'IP'
    end

    # Retrieve passages from our Devotions section
    # 
    # See http://www.esvapi.org/api for more information and options
    def query(options={})
      self.class.get '/readingPlanQuery', :query => @default_options.merge(options)
    end
    
    # Parse and display information about the reading plan for a given date
    # 
    # See http://www.esvapi.org/api for more information and options
    def info(options={})
      info = self.class.get '/readingPlanInfo', :query => @default_options.merge(options)
      info["crossway_bible"]
    end
  end
end