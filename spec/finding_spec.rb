require File.dirname(__FILE__) + '/spec_helper'

module Rebay
  describe Finding do
    before(:each) do
        @finder = Finding.new
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new({"Ack" => 'Success'}))
    end

    it "should specify base url" do
      expect(Finding.base_url).not_to be_nil
    end
    
    it "should specify version" do
      expect(Finding::VERSION).not_to be_nil
    end
    
    context "after creation" do
      it "should provide find_items_advanced" do
        expect(@finder).to respond_to(:find_items_advanced)
      end
      
      it "should provide find_items_by_category" do
        expect(@finder).to respond_to(:find_items_by_category)
      end
      
      it "should provide find_items_by_product" do
        expect(@finder).to respond_to(:find_items_by_product)
      end
      
      it "should provide find_items_in_ebay_stores" do
        expect(@finder).to respond_to(:find_items_in_ebay_stores)
      end
      
      it "should provide get_histograms" do
        expect(@finder).to respond_to(:get_histograms)
      end
      
      it "should provide get_search_keywords_recommendation" do
        expect(@finder).to respond_to(:get_search_keywords_recommendation)
      end
      
      it "should provide get_version" do
        expect(@finder).to respond_to(:get_version)
      end
    end
    
    context "when calling find_items_advanced" do     
      it "should fail without args" do
        expect { @finder.find_items_advanced }.to raise_error(ArgumentError)
      end
      
      it "should return a hash response with categoryId as parameter" do
        expect(@finder.find_items_advanced({:categoryId => 1}).class).to eq(Rebay::Response)
      end
      
      it "should return a hash response with keywords as parameter" do
        expect(@finder.find_items_advanced({:keywords => 'feist'}).class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.find_items_advanced({:keywords => 'feist'}).success?).to be_truthy
      end
      
      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/finding/find_items_advanced"))
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @finder.find_items_advanced({:keywords => 'whatevs'})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(2)
      end
      
      it "should work with 1 result" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/finding/find_items_advanced_one_item"))
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @finder.find_items_advanced({:categoryId => 1})
        count = 0

        response.each { |r| count = count + 1 }
        expect(count).to eq(1)
      end
    end
    
    context "when calling find_items_by_category" do     
      it "should fail without args" do
        expect { @finder.get_search_keywords_recommendation }.to raise_error(ArgumentError)
      end
      
      it "should return a hash response" do
        expect(@finder.find_items_by_category({:categoryId => 1}).class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.find_items_by_category({:categoryId => 1}).success?).to be_truthy
      end
      
      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/finding/find_items_by_category"))
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @finder.find_items_by_category({:categoryId => 1})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(2)
      end
    end
    
    context "when calling find_items_by_product" do    
      it "should fail without args" do
        expect { @finder.find_items_by_product }.to raise_error(ArgumentError)
      end
      
      it "should return a hash response" do
        expect(@finder.find_items_by_product({:productId => 53039031}).class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.find_items_by_product({:productId => 53039031}).success?).to be_truthy
      end
      
      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/finding/find_items_by_product"))
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @finder.find_items_by_product({:productId => 1})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(2)
      end
    end
  
    context "when calling find_items_by_keywords" do     
      it "should fail without args" do
        expect { @finder.find_items_by_keywords }.to raise_error(ArgumentError)
      end
      
      it "should return a hash response" do
        expect(@finder.find_items_by_keywords({:keywords => 'feist'}).class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.find_items_by_keywords({:keywords => 'feist'}).success?).to be_truthy
      end
      
      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/finding/find_items_by_keywords"))
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @finder.find_items_by_keywords({:keywords => 'whatevs'})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(2)
      end
    end
    
    context "when calling find_items_in_ebay_stores" do
      it "should fail without args" do
        expect { @finder.find_items_in_ebay_stores }.to raise_error(ArgumentError)
      end
      
      it "should return a hash response with storeName as parameter" do
        expect(@finder.find_items_in_ebay_stores({:storeName => 'Laura_Chen\'s_Small_Store'}).class).to eq(Rebay::Response)
      end
      
      it "should return a hash response with keywords as parameter" do
        expect(@finder.find_items_in_ebay_stores({:keywords => 'feist'}).class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.find_items_in_ebay_stores({:keywords => 'feist'}).success?).to be_truthy
      end
    end
    
    context "when calling get_histograms" do
      it "should fail without args" do
        expect { @finder.get_histograms }.to raise_error(ArgumentError)
      end
      
      it "should return a hash response" do
        expect(@finder.get_histograms({:categoryId => 1}).class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.get_histograms({:categoryId => 1}).success?).to be_truthy
      end
    end
    
    context "when calling get_search_keywords_recommendation" do
      it "should fail without args" do
        expect { @finder.get_search_keywords_recommendation }.to raise_error(ArgumentError)
      end
      
      it "should return a hash response" do
        expect(@finder.get_search_keywords_recommendation({:keywords => 'feist'}).class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.get_search_keywords_recommendation({:keywords => 'feist'}).success?).to be_truthy
      end
      
      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/finding/get_search_keywords_recommendation"))
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @finder.get_search_keywords_recommendation({:keywords => 'whatevs'})
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(1)
        
        expect(response.results).to eq('harry potter phoenix')
      end
    end
    
    context "when calling get_version" do
      it "should return a hash response" do
        expect(@finder.get_version.class).to eq(Rebay::Response)
      end
      
      it "should succeed" do
        expect(@finder.get_version.success?).to be_truthy
      end
      
      it "should iterate over results" do
        json = JSON.parse(File.read(File.dirname(__FILE__) + "/json_responses/finding/get_version"))
        allow(@finder).to receive(:get_json_response).and_return(Rebay::Response.new(json))
        response = @finder.get_version
        
        count = 0
        response.each { |r| count = count + 1 }
        expect(count).to eq(1)
        
        expect(response.results).to eq('1.8.0')
      end
    end
  end
end
