class App
  def call env
    ['200', {'Content-Type' => 'text/html'}, ['it works yes !!']]
  end
end
