class ScssEngine < Sinatra::Base
  set :views,   File.dirname(__FILE__) + '/../assets/stylesheets'

  get '/stylesheets/*.css' do
    filename = File.join(params[:splat])
    scss filename.to_sym
  end
end

class JsEngine < Sinatra::Base
  set :views,   File.dirname(__FILE__) + '/../assets/javascripts'

  get '/javascripts/*.js' do
    filename = File.join(settings.views, params[:splat]) + '.js'
    send_file filename, type: 'text/javascript'
  end
end

class ImagesEngine < Sinatra::Base
  set :views,   File.dirname(__FILE__) + '/../assets/images'

  get '/images/*' do
    filename = File.join(settings.views, params[:splat])
    send_file filename
  end
end

class WorkspaceApp < Sinatra::Base
  use ScssEngine
  use JsEngine
  use ImagesEngine

  set :public_folder, File.dirname(__FILE__) + '/../public'
  set :views,         File.dirname(__FILE__) + '/../templates'

  error 404 do
    'Page not found'
  end

  get '/*/?:template?' do
    if params[:template] && has_no_file_extension(params[:template])
      params[:splat].push(params[:template])
      params[:template] = nil
    end

    template = params[:template] || 'index.html'
    puts params[:splat]
    view_path  = File.join(settings.views, params[:splat])

    unless File.exists?(File.join(view_path, "#{template}.haml"))
      puts File.join(view_path, "#{template}.haml")
      raise Sinatra::NotFound
    end

    layout = layout_from_view_path(view_path)

    haml template.to_sym, views: view_path, layout: layout.to_sym
  end

  private

  def has_no_file_extension(filename)
    filename.scan(/\.html$/).empty?
  end

  def layout_from_view_path(view_path)
    unless File.exists?(File.join(view_path, 'layout.haml'))
      depth = File.split(view_path).length - 1
      alternate_layout = ('../' * depth) + 'layout'
    end

    alternate_layout || 'layout'
  end

end
