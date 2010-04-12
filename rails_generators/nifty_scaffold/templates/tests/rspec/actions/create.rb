  describe "POST create" do
    before(:each) do
      @<%= singular_name %> = stub('New <%= class_name %>', :save => true, :class => <%= class_name %>)
      <%= class_name %>.stubs(:new).returns(@<%= singular_name %>)

      @<%= singular_name %>_params = stub('<%= class_name %> params') 
    end

    it "sould generate a new <%= class_name %> from the params" do
      @<%= singular_name %>.expects(:new).with(@<%= singular_name %>_params).returns(@<%= singular_name %>)
      post :create, :<%= singular_name %> => @<%= singular_name %>_params
    end

    it "should save the <%= class_name %>" do
      @<%= singular_name %>.expects(:save).returns(true)
      post :create, :<%= singular_name %> => @<%= singular_name %>_params
    end

    context "when the save is succesful" do
      before(:each) do
        @<%= singular_name %>.stubs(:save).returns(true)
      end

      it "should set the flash notice" do
        post :create, :<%= singular_name %> => @<%= singular_name %>_params
        flash[:notice].should_not be_blank
      end

      it "should redirect to the show page" do
        post :create, :<%= singular_name %> => @<%= singular_name %>_params
        response.should redirect_to(<%= singular_name %>_url(@<%= singular_name %>))
      end
    end

    context "when the save is un-succesful" do
      before(:each) do
        @<%= singular_name %>.stubs(:save).returns(false)
      end

      it "should render the new action" do
        post :create, :<%= singular_name %> => @<%= singular_name %>_params
        response.should render_template(:new)
      end
      
      it "should assign the <%= class_name %> to @<%= singular_name %>" do
        post :create, :<%= singular_name %> => @<%= singular_name %>_params
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
      end
    end
  end
