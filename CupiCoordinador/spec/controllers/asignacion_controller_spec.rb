require 'spec_helper'

describe AsignacionController do

  describe "GET 'cupos'" do
    it "returns http success" do
      get 'cupos'
      response.should be_success
    end
  end

end
