  describe "GET edit" do
    before(:each) do
      @<%= singular_name %> = stub('Existing <%= class_name %>')
      <%= class_name %>.stubs(:find).returns(@<%= singular_name %>)
    end

    it "edit action should render edit template" do
      get :edit, :id => 1
      response.should render_template(:edit)
    end
    
    it "should find the given <%= class_name %>" do
      <%= class_name %>.expects(:find).with("1").returns(@<%= singular_name %>)
      get :edit, :id => 1
    end
    
    it "should assign the <%= class_name %> to @<%= singular_name %>" do
      get :edit, :id => 1
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
  end
  
