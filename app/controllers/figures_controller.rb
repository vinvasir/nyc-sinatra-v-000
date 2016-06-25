class FiguresController < ApplicationController
    get '/figures' do
       @figures = Figure.all
       erb :'/figures/index'
    end
    
    get '/figures/new' do
        erb :'/figures/new'
    end
    
    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :'/figures/show'
    end 
    
    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])    
        erb :'/figures/edit' 
    end    
    
    post '/figures' do
        @figure = Figure.create(params[:figure])
        unless params[:title][:name].empty?
            new_title = Title.create(name: params[:title][:name]) 
            @figure.titles << new_title
        end
        
        unless params[:landmark][:name].empty?
            new_landmark = Landmark.create(name: params[:landmark][:name]) 
            @figure.landmarks << new_landmark
        end
        @figure.save
        
        redirect "/figures/#{@figure.id}"
    end
    
    patch '/figures/:id' do
       @figure = Figure.find(params[:id])
       @figure.update(params[:figure])
       
       unless params[:title][:name].empty?
            new_title = Title.create(name: params[:title][:name]) 
            @figure.titles << new_title
        end
        
        unless params[:landmark][:name].empty?
            new_landmark = Landmark.create(name: params[:landmark][:name]) 
            @figure.landmarks << new_landmark
        end
        @figure.save
        
        redirect "/figures/#{@figure.id}"
    end
    
end
