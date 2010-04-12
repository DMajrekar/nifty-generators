  describe "GET new" do
    before(:each) do
      @<%= singular_name %> = stub('New <%= class_name %>')
      <%= class_name %>.stubs(:new).returns(@<%= singular_name %>)
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

    it "should get a new <%= class_name %>" do
      <%= class_name %>.expects(:new).returns(@<%= singular_name %>)
      get :new
    end

    it "should assign the new <%= class_name %> to @<%= singular_name %>" do
      get :new
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
  end
  