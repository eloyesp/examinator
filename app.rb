class App
  def call env
    ['200', {'Content-Type' => 'text/html'}, contents(env['REQUEST_PATH'])]
  end

  def contents file
    command = <<CMD
| pandoc \
  --to html5 \
  --from markdown \
  --standalone \
  --css "/css/examinator.css" \
  examenes#{ file }
CMD
    File.readlines(command) #examenes#{ file }")
  end

  def footer env
    ['<footer>',
     env.map do |key, value|
       <<-HTML.gsub(/^\s+\|/,'')
       | <dt>#{ key }</dt>
       | <dd>#{ value }</dd>
       HTML
     end.join("\n"),
     '</footer>'
    ].join("\n")
  end
end
