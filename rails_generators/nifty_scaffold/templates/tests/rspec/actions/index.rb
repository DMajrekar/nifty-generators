  describe "GET index" do
    before(:each) do
      @<%= singular_name %>s = stub('<%= plural_name %> Array')
      <%= class_name %>.stubs(:all).returns(@<%= singular_name %>s)
    end

    it "should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "should find all of the <%= class_name %>s" do
      <%= class_name %>.expects(:all).returns([])
    end

    it "should assign the hardware nodes to @<%= plural_name %>" do
      get :index
      assigns[:<%= plural_name %>].should == @<%= singular_name %>s
    end
  end
