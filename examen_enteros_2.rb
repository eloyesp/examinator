require 'erb'
require 'pry'

def formatear numero
  numero < 0 ? "(#{ numero})" : numero
end

def numero_entero cifras = 1
  rango = cifras * 10
  numero = rand(rango * 2) - rango
  formatear numero
end

def sumas_y_restas_con_dos_cifras
  "$#{ formatear rand(10..30) } - #{ formatear rand(10..90) } - #{ formatear rand(10..90) } + #{ formatear rand(10..90) } =$"
end

def sumas_con_tres_cifras
  "$#{ formatear rand(100..600) } + #{ formatear rand(-1000..-90) } + #{ formatear rand(-1000..-90) } =$"
end

def resta_de_tres_cifras
  n = rand(1000..6000)
  "$#{ formatear n } - #{ n + rand(3000) } =$"
end

def sumas_y_restas_de_una_cifra
  "$#{ formatear rand(2..10) } + #{ formatear rand(2..10) } - #{ formatear rand(2..10) } =$"
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
