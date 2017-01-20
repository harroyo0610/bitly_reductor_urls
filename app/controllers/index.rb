get '/' do
  #Despliega una lista de URLs.

  @urls_list = []
  Url.all.each do |t|
    @urls_list << t
  end
  @urls_list
  erb :index
end


post '/urls' do
  # crea una nueva Url
  @@long = params[:url]
  Url.create(long_url: @@long, click_count: 0)
  redirect to("/")
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  short = params[:short_url]
  
  url = Url.find_by(short_url: short)
  url.click_count += 1
  url.save!
  redirect to("#{url.long_url}")
end