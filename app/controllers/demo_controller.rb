class DemoController < ApplicationController

  def index

    @index_title = "Index World!"

    # this is the default action
    render('index')
  end

  def hello

    @hello_title = "Hello World!"
    @id    = params['id']
    @page  = params[:page]
    @array = [1,2,3,4,5]
    # this is the default action
    render(:template => 'demo/hello')
  end

  # redirect
  def redirect_to_hello
    redirect_to(:action => 'hello')
  end

end
