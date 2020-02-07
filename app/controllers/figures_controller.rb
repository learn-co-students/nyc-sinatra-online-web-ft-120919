class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end

    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    end

    if @figure.save
      redirect "/figures/#{@figure.id}"
    else
      erb :'/figures/new'
    end
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end

    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    end
    if @figure.save
      redirect "/figures/#{@figure.id}"
    else
      erb :'/figures/edit'
    end
  end
end
