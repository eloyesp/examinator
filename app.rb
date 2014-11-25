class App
  def call env
    ['200', {'Content-Type' => 'text/html'}, contents]
  end

  def contents
    `./process_markdown`
    File.readlines('examenes/primero_diciembre-marzo.html')
  end
end
