get '/' do
  #Despliega una lista de URLs.

  @urls_list = []
  Url.all.each do |t|
    @urls_list << t
  end
  @urls_list
  erb :index_2
end


post '/urls' do
  # crea una nueva Url
  long = params[:url]
  Url.create(long_url: long, click_count: 0)
  redirect to("/")
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  short = params[:short_url]
  if short=="login"
    erb :login
  elsif short=="register"
    erb :create_count
  elsif short=="logout"
    redirect to("/")
  elsif short != "login" || short != "register"
    url = Url.find_by(short_url: short)
    url.click_count +=1
    url.save!
    redirect to("#{url.long_url}")
  end
end

post '/secret_page' do
  erb :secret_page
end