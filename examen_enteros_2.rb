require 'erb'
require 'pry'

def ejercicio_1
  "$#{ rand(10) - 5 } + #{ rand(10) - 5 } =$"
end

def build
  template = File.new('examen_enteros.md.erb')
  erb = ERB.new(template.read, nil, '<>')
  output = File.basename template, '.erb'
  File.open output, 'w' do |out|
    out.puts erb.result
  end
end

build
