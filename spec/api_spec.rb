require File.dirname(__FILE__) + '/spec_helper'


module Rebay
  describe Api do
    describe "#configure" do
      it "should respond to configure" do
        expect(Rebay::Api).to respond_to(:configure)
      end
      
      describe "#base_url_prefix" do
        it "shouldn't be nil" do
          expect(Rebay::Api.base_url_prefix).not_to be_nil
        end
      end

      describe "#base_url_suffix" do
        it "shouldn't be nil" do
          expect(Rebay::Api.base_url_suffix).not_to be_nil
        end
      end
      
      describe "#base_url" do
        context "api calls should hit the sandbox" do
          it "should return a sandboxed url" do
            Rebay::Api.configure do |c|
              c.sandbox = true
            end
          
            expect(Rebay::Api.base_url).to include "sandbox"
          end
        end

        context "api calls shouldn't hit the sandbox" do
          it "should return a un-sandboxed url" do
            Rebay::Api.configure do |c|
              c.sandbox = false
            end

            expect(Rebay::Api.base_url).not_to include "sandbox"
          end
        end
      end

      describe "#sandbox" do
        it_behaves_like "a configuration option", :sandbox, true
      end
      
      describe "#app_id" do
        it_behaves_like "a configuration option", :app_id, 'super_id-11'
      end

      describe "#default_site_id" do
        it_behaves_like "a configuration option", :default_site_id, 100

        it "should default to EBAY_US" do
          expect(Rebay::Api.default_site_id).to eq Rebay::Api::EBAY_US
        end
      end
    end

    context "when calling build_rest_payload" do
      before(:each) do
        @api = Rebay::Api.new
      end

      it "should build rest payload from hash" do
        payload = @api.send(:build_rest_payload, {:test=>'blah', :test2=>'blah', :test3=>'blah'})
        expect(payload).to include("&test=blah")
        expect(payload).to include("&test2=blah")
        expect(payload).to include("&test3=blah")
      end

      it "should escape html chars" do
         payload = @api.send(:build_rest_payload, {:test=>'blah', :test2=>'blah', :test3=>'blah blah'})
         expect(payload).to include("&test=blah")
         expect(payload).to include("&test2=blah")
         expect(payload).to include("&test3=blah%20blah")
      end
    end
  end
end
    