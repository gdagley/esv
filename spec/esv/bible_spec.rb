require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ESV::Bible do
  before do
    @bible = ESV::Bible.new(:key => 'TEST')
  end
  
  describe "passage_query" do
    it "should retrieve the passage" do
      stub_get("http://www.esvapi.org/v2/rest/passageQuery?passage=John%201&key=TEST", "passage_query.html")
      @bible.passage_query('John 1').should include("<h2>John 1")
    end

    it "should retrieve the passage as XML" do
      stub_get("http://www.esvapi.org/v2/rest/passageQuery?output-format=crossway-xml-1.0&key=TEST&passage=John%201", "passage_query.xml")
      passage = @bible.passage_query('John 1', 'output-format' => 'crossway-xml-1.0')['crossway_bible']["passage"]
      passage["reference"].should == "John 1"
    end
  end
  
  describe "query" do
  end
  
  describe "query_info" do
  end
  
  describe "verse" do
  end

  describe "daily_verse" do
  end
end
