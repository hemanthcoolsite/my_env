class DashBoardController < ApplicationController
  http_basic_authenticate_with name: "sofdep", password: "sofdep@2022"
  
  require "json"
  require "csv"
  
  csv_table = CSV.parse(File.read('app/assets/javascript/result.csv'), headers: true)
  @@json_string = csv_table.map(&:to_h).to_json


  def index
    @hash = JSON.parse(@@json_string)
    @count=@hash.count
  end

  def search
    @value = JSON.parse(@@json_string)
    @svalue = params[:svalue]
    @count=@value.count
    puts(@svalue)
    if @svalue == ""
      @hash= @value
      render "index"
    else
      @res_hash=[]
        @value.each do |item|
          item.each do |k,v|
            if v == @svalue 
              @res_hash << item
            elsif v == @svalue+'.temenosgroup.com'
              @res_hash << item
            end
          end
        end
    end
    @hash=@res_hash   
  end

end