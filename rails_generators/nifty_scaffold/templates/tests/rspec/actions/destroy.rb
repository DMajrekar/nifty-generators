  describe "DELETE destroy" do
    before(:each) do
      @<%= singular_name %> = stub("<%= class_name %> to Delete", :destroy => true)
      <%= class_name %>.stubs(:find).returns(@<%= singular_name %>)
    end

    it "should find the <%= class_name %>" do
      <%= class_name %>.expects(:find).with("1").returns(@<%= singular_name %>)
      delete :destroy, :id => 1
    end

    it "should delete the <%= class_name %>" do
      @<%= singular_name %>.expects(:destroy)
      delete :destroy, :id => 1
    end

    it "should set the flash notice" do
      delete :destroy, :id => 1
      flash[:notice].should_not be_blank
    end

    it "should redirect to the index page" do
      delete :destroy, :id => 1
      response.should redirect_to(<%= singular_name %>s_url)
    end
  end
