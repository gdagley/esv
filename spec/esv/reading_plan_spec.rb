require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ESV::ReadingPlan do
  before do
    @plan = ESV::ReadingPlan.new(:key => 'TEST')
  end
  
  describe "query" do
    it "should retrieve the daily reading" do
      stub_get("http://www.esvapi.org/v2/rest/readingPlanQuery?key=TEST", "reading_plan_query.html")
      @plan.query.should include("<h2>2 Samuel 2")
    end

    it "should retrieve the daily reading as XML" do
      stub_get("http://www.esvapi.org/v2/rest/readingPlanQuery?output-format=crossway-xml-1.0&key=TEST", "reading_plan_query.xml")
      reading = @plan.query('output-format' => 'crossway-xml-1.0')["crossway_bible"]
      reading["passage"][0]["reference"].should == "2 Samuel 2"
    end

    it "should retrieve the daily reading for a specific date" do
      stub_get("http://www.esvapi.org/v2/rest/readingPlanQuery?date=2009-10-01&key=TEST", "reading_plan_query.html")
      @plan.query('date' => '2009-10-01').should include("<h2>2 Samuel 2")
    end
  end
  
  describe "info" do
    it "should retrieve XML info for reading plan" do
      stub_get("http://www.esvapi.org/v2/rest/readingPlanInfo?key=TEST", "reading_plan_info.xml")
      info = @plan.info['crossway_bible']
      info["plan"].should == "one-year-tract"
      info["date"].should == "20090908"
    end
  end
end
