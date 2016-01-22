require File.dirname(__FILE__) + '/spec_helper'

module Rebay
  describe Shopping do
    before(:each) do
      @shopper = Shopping.new
      allow(@shopper).to receive(:get_json_response).and_return(Rebay::Response.new({"Ack" => "Success"}))
    end

    it "should specify base url" do
      expect(Shopping.base_url).not_to be_nil
    end

    it "should specify version" do
      expect(Shopping::VERSION).not_to be_nil
    end

    context "siteid" do
      it "should default siteid" do
        expect(@shopper).to receive(:get_json_response).with(/siteid=0&/)
        @shopper.get_category_info(:CategoryID => '-1')
      end

      it "should default siteid" do
        Rebay::Api.default_site_id = 100
        expect(@shopper).to receive(:get_json_response).with(/siteid=100&/)
        @shopper.get_category_info(:CategoryID => '-1')
      end

      it "should default siteid" do
        Rebay::Api.default_site_id = 100
        expect(@shopper).to receive(:get_json_response).with(/siteid=99&/)
        @shopper.get_category_info(:CategoryID => '-1', :siteid => 99)
      end
    end

    context "after creation" do
      it "should provide get_category_info" do
        expect(@shopper).to respond_to(:get_category_info)
      end

      it "should provide get_category_info_with_children" do
        expect(@shopper).to respond_to(:get_category_info_with_children)
      end

      it "should provide find_products" do
        expect(@shopper).to respond_to(:find_products)
      end

      it "should provide find_half_products" do
        expect(@shopper).to respond_to(:find_half_products)
      end

      it "should provide get_single_item" do
        expect(@shopper).to respond_to(:get_single_item)
      end

      it "should provide get_item_status" do
        expect(@shopper).to respond_to(:get_item_status)
      end

      it "should provide get_shipping_costs" do
        expect(@shopper).to respond_to(:get_shipping_costs)
      end

      it "should provide get_multiple_items" do
        expect(@shopper).to respond_to(:get_multiple_items)
      end

      it "should provide get_user_profile" do
        expect(@shopper).to respond_to(:get_user_profile)
      end

      it "should provide find_popular_searches" do
        expect(@shopper).to respond_to(:find_popular_searches)
      end

      it "should provide find_popular_items" do
        expect(@shopper).to respond_to(:find_popular_items)
      end

      it "should provide find_reviews_and_guides" do
        expect(@shopper).to respond_to(:find_reviews_and_guides)
      end
    end

    context "when calling get_category_info" do
      it "should fail without args" do
        expect { @shopper.get_category_info }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.get_category_info({:CategoryID => 29223}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.get_category_info({:CategoryID => 29223}).success?).to be_truthy
      end

      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/shopping/get_category_info"))
        allow(@shopper).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        
        response = @shopper.get_category_info({:CategoryID => 1})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(1)
      end
    end

    context "when calling find_products" do
      it "should fail without args" do
        expect { @shopper.find_products }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.find_products({:QueryKeywords => 'harry potter'}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.find_products({:QueryKeywords => 'harry potter'}).success?).to be_truthy
      end

      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/shopping/find_products"))
        allow(@shopper).to receive(:get_json_response).and_return(Rebay::Response.new(json))

        response = @shopper.find_products({:QueryKeywords => 'whatevs'})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(2)
      end
    end

    context "when calling find_half_products" do
      it "should fail without args" do
        expect { @shopper.find_half_products }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.find_half_products({:QueryKeywords => 'harry potter'}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.find_half_products({:QueryKeywords => 'harry potter'}).success?).to be_truthy
      end

      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/shopping/find_half_products"))
        allow(@shopper).to receive(:get_json_response).and_return(Rebay::Response.new(json))

        response = @shopper.find_half_products({:QueryKeywords => 'whatevs'})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(2)
      end
    end

    context "when calling get_single_item" do
      it "should fail without args" do
        expect { @shopper.get_single_item }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.get_single_item({:ItemID => 230139965209}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.get_single_item({:ItemID => 230139965209}).success?).to be_truthy
      end
    end

    context "when calling get_item_status" do
      it "should fail without args" do
        expect { @shopper.get_item_status }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.get_item_status({:ItemID => 230139965209}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.get_item_status({:ItemID => 230139965209}).success?).to be_truthy
      end
    end

    context "when calling get_shipping_costs" do
      it "should fail without args" do
        expect { @shopper.get_shipping_costs }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.get_shipping_costs({:ItemID => 230139965209}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.get_shipping_costs({:ItemID => 230139965209}).success?).to be_truthy
      end
    end

    context "when calling get_multiple_items" do
      it "should fail without args" do
        expect { @shopper.get_multiple_items }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.get_multiple_items({:ItemID => 230139965209}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.get_multiple_items({:ItemID => 230139965209}).success?).to be_truthy
      end
    end

    context "when calling get_user_profile" do
      it "should fail without args" do
        expect { @shopper.get_user_profile }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.get_user_profile({:UserID => 1}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.get_user_profile({:UserID => 1}).success?).to be_truthy
      end
    end

    context "when calling find_popular_searches" do
      it "should fail without args" do
        expect { @shopper.find_popular_searches }.to raise_error(ArgumentError)
      end

      it "should return a hash response" do
        expect(@shopper.find_popular_searches({:CategoryID => 1}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.find_popular_searches({:CategoryID => 1}).success?).to be_truthy
      end

      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/shopping/find_popular_searches"))
        allow(@shopper).to receive(:get_json_response).and_return(Rebay::Response.new(json))

        response = @shopper.find_popular_searches({:CategoryID => 1})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(1)
      end
    end

    context "when calling find_popular_items" do
      it "should return a hash response" do
        expect(@shopper.find_popular_items({:CategoryID => 1}).class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.find_popular_items({:CategoryID => 1}).success?).to be_truthy
      end

      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/shopping/find_popular_items"))
        allow(@shopper).to receive(:get_json_response).and_return(Rebay::Response.new(json))

        response = @shopper.find_popular_items({:CategoryID => 1})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(19)
      end
    end

    context "when calling find_reviews_and_guides" do
      it "should return a hash response" do
        expect(@shopper.find_reviews_and_guides.class).to eq(Rebay::Response)
      end

      it "should succeed" do
        expect(@shopper.find_reviews_and_guides.success?).to be_truthy
      end

      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/shopping/find_reviews_and_guides"))
        allow(@shopper).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @shopper.find_reviews_and_guides

        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(5)
      end
    end
  end
end
