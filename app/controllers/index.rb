get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_form
end

post '/events/create' do
  p params.inspect
  myevent = Event.create(title: params[:title], date:params[:date], organizer_email:params[:email], organizer_name:params[:name])
  if !myevent.errors.messages.empty?
      @msg = myevent.errors.messages
      erb :new_form
  else
    @msg = "your event was succesfully added"
    redirect "/?msg=#{@msg}"
end
end
