require 'erb'

class App
  def call env
    [ '200',
      {'Content-Type' => 'text/html'},
      build(env['REQUEST_PATH'])
    ]
  end

  def build file
    raise 'Template format is wrong' unless file.match(/\.erb$/)
    template = File.read "examenes#{ file }"
    erb = ERB.new template, nil, '<>'
    result = erb.result
    process_with_pandoc result
  end

  def process_with_pandoc text
    command = "| pandoc " \
              " --to html5 " \
              " --from markdown " \
              " --standalone " \
              " --css '/css/examinator.css' " \
              " - "
    open command, 'r+' do |pandoc|
      pandoc.puts text
      pandoc.close_write
      pandoc.readlines
    end
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
