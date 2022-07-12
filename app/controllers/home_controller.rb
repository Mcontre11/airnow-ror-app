      # this might not be needed because it comes with ruby already but just incase I installed it in gemfile because I tried it without and it actually didnt work
require 'net/http'
require 'json'
class HomeController < ApplicationController

  def search 
       zipCode = params[:query]
    #in order for string interpolation to work there needs to be double quotes
        @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{zipCode}&distance=0&API_KEY=80A0AAAA-84B8-4740-8C40-A2D982D6ABBD"
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @output = JSON.parse(@response)
    
    
        if @output.empty?
         @final_output = "ERROR"
        elsif !@output
        @final_output = "ERROR"
        else
         @final_output =   @output[0] ['AQI']
        end
    
      
        if @final_output == "ERROR"
          @api_color = "grey"
      elsif @final_output <= 50 
        @api_color = "green"  
      elsif @final_output >= 51 && @final_output <=100
        @api_color = "yellow"
      elsif @final_output >= 101 && @final_output <=150
        @api_color = "orange"
      elsif @final_output >= 151 && @final_output <=200
        @api_color = "red"
      elsif @final_output >= 201 && @final_output <=300
        @api_color = "purple"
      elsif @final_output >= 301 && @final_output <=500
        @api_color = "maroon"
      end
    
      if  @final_output == "ERROR"
         @api_meaning = "Sorry there seems to be a problem with your areacode"
      elsif
         @final_output <= 50 
        @api_meaning = "It’s a great day to be active outside."
      elsif
        @final_output >= 51 && @final_output <=100
        @api_meaning =  "Unusually sensitive people: Consider reducing prolonged
        or heavy outdoor exertion. Watch for symptoms such as
        coughing or shortness of breath. These are signs to take it
        easier.
        Everyone else: It’s a good day to be active outside."
      elsif @final_output >= 101 && @final_output <=150
        @api_meaning = "Sensitive groups: Reduce prolonged or heavy outdoor exertion. Take more breaks, do less intense activities. Watch for
          symptoms such as coughing or shortness of breath. Schedule outdoor activities in the morning when ozone is lower.
          People with asthma should follow their asthma action
          plans and keep quick- relief medicine handy."
      elsif @final_output >= 151 && @final_output <=200
        @api_meaning = "Sensitive groups: Avoid prolonged or heavy outdoor exertion. Schedule outdoor activities in the morning when ozone
        is lower. Consider moving activities indoors. People with
        asthma, keep quick-relief medicine handy.
        Everyone else: Reduce prolonged or heavy outdoor exertion. Take more breaks, do less intense activities. Schedule
        outdoor activities in the morning when ozone is lower. "
      elsif @final_output >= 201 && @final_output <=300
        @api_meaning = "Sensitive groups: Avoid all physical activity outdoors. Move
        activities indoors or reschedule to a time when air quality
        is better. People with asthma, keep quick-relief medicine
        handy.
        Everyone else: Avoid prolonged or heavy outdoor exertion.
        Schedule outdoor activities in the morning when ozone is
        lower. Consider moving activities indoors. "
      elsif @final_output >= 301 && @final_output <=500
        @api_meaning = "Everyone: Avoid all physical activity outdoors."
     
    end
    render 'index'
  end

  def index
  # this might not be needed because it comes with ruby already but just incase I installed it in gemfile because I tried it without and it actually didnt work


    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=02861&distance=0&API_KEY=80A0AAAA-84B8-4740-8C40-A2D982D6ABBD'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)


    if @output.empty?
     @final_output = "ERROR"
    elsif !@output
    @final_output = "ERROR"
    else
     @final_output =   @output[0] ['AQI']
    end
  
  
    if @final_output == "ERROR"
      @api_color = "grey"
  elsif @final_output <= 50 
    @api_color = "green"  
  elsif @final_output >= 51 && @final_output <=100
    @api_color = "yellow"
  elsif @final_output >= 101 && @final_output <=150
    @api_color = "orange"
  elsif @final_output >= 151 && @final_output <=200
    @api_color = "red"
  elsif @final_output >= 201 && @final_output <=300
    @api_color = "purple"
  elsif @final_output >= 301 && @final_output <=500
    @api_color = "maroon"
  end

  if  @final_output == "ERROR"
     @api_meaning = "Sorry there seems to be a problem with your areacode"
  elsif
     @final_output <= 50 
    @api_meaning = "It’s a great day to be active outside."
  elsif
    @final_output <= 51 && @final_output <=100
    @api_meaning =  "Unusually sensitive people: Consider reducing prolonged
    or heavy outdoor exertion. Watch for symptoms such as
    coughing or shortness of breath. These are signs to take it
    easier.
    Everyone else: It’s a good day to be active outside."
  elsif @final_output >= 101 && @final_output <=150
    @api_meaning = "Sensitive groups: Reduce prolonged or heavy outdoor exertion. Take more breaks, do less intense activities. Watch for
      symptoms such as coughing or shortness of breath. Schedule outdoor activities in the morning when ozone is lower.
      People with asthma should follow their asthma action
      plans and keep quick- relief medicine handy."
  elsif @final_output >= 151 && @final_output <=200
    @api_meaning = "Sensitive groups: Avoid prolonged or heavy outdoor exertion. Schedule outdoor activities in the morning when ozone
    is lower. Consider moving activities indoors. People with
    asthma, keep quick-relief medicine handy.
    Everyone else: Reduce prolonged or heavy outdoor exertion. Take more breaks, do less intense activities. Schedule
    outdoor activities in the morning when ozone is lower. "
  elsif @final_output >= 201 && @final_output <=300
    @api_meaning = "Sensitive groups: Avoid all physical activity outdoors. Move
    activities indoors or reschedule to a time when air quality
    is better. People with asthma, keep quick-relief medicine
    handy.
    Everyone else: Avoid prolonged or heavy outdoor exertion.
    Schedule outdoor activities in the morning when ozone is
    lower. Consider moving activities indoors. "
  elsif @final_output >= 301 && @final_output <=500
    @api_meaning = "Everyone: Avoid all physical activity outdoors."
 
  end
end
end