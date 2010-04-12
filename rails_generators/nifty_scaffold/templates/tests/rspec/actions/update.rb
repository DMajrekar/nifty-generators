  describe "PUT update" do
    before(:each) do
      @<%= singular_name %> = stub('Existing <%= class_name %>', :update_attributes => true, :class => <%= class_name %>)
      <%= class_name %>.stubs(:find).returns(@<%= singular_name %>)

      @<%= singular_name %>_params = stub('<%= class_name %> params')
    end
    
    it "should find the <%= class_name %>" do
      <%= class_name %>.expects(:find).with("1").returns(@<%= singular_name %>)
      put :update, :id => 1, :<%= singular_name %> => @<%= singular_name %>_params
    end
    
    it "should update_attributes on the <%= class_name %>" do
      @<%= singular_name %>.expects(:update_attributes).with(@<%= singular_name %>_params).returns(true)
      put :update, :id => 1, :<%= singular_name %> => @<%= singular_name %>_params
    end
    
    context "when the update_attribetues is succesful" do
      before(:each) do
        @<%= singular_name %>.stubs(:update_attributes).returns(true)
      end

      it "should set the flash message" do
        put :update, :id => 1, :<%= singular_name %> => @<%= singular_name %>_params
        flash[:notice].should_not be_blank
      end
      
      it "should redirect to the show page" do
        put :update, :id => 1, :<%= singular_name %> => @<%= singular_name %>_params
        response.should redirect_to(<%= singular_name %>_url(@<%= singular_name %>))
      end
      
    end
    
    context "when the update_attribetues is un-succesful" do
      before(:each) do
        @<%= singular_name %>.stubs(:update_attributes).returns(false)
      end

      it "should render the edit action" do
        put :update, :id => 1, :<%= singular_name %> => @<%= singular_name %>_params
        response.should render_template(:edit)
      end
      
      it "should assign the <%= class_name %> to @<%= singular_name %>" do
        put :update, :id => 1, :<%= singular_name %> => @<%= singular_name %>_params
        assigns[@<%= singular_name %>].should == @<%= singular_name %>
      end
    end
  end
  