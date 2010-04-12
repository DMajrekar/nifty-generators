  describe "GET show" do
    before(:each) do
      @<%= singular_name %> = stub('Existing <%= class_name %>')
      <%= class_name %>.stubs(:find).returns(@<%= singular_name %>)
    end

    it "show action should render show template" do
      get :show, :id => 1
      response.should render_template(:show)
    end

    it "should get the <%= class_name %>" do
      <%= class_name %>.expects(:find).returns(@<%= singular_name %>)
      get :show, :id => 1
    end

    it "should assign the <%= class_name %> to @<%= singular_name %>" do
      get :show, :id => 1
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
  end
