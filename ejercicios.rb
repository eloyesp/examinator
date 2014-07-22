def suma_de_fracciones
  "$#{ fraccion_simple } + #{fraccion_simple}=...$"
end

def multiplicacion_de_fracciones
  "$#{ fraccion_simple } \\times #{fraccion_simple}=...$"
end

def fraccion_simple
  numerador = rand(1..5)
  denominador = ((2..5).to_a - [numerador]).sample
  "\\frac{#{ numerador }}{#{ denominador }}"
end

def completar_suma faltante
  sumando = rand(1..10)
  suma = sumando + rand(1..10)
  case faltante
  when :primer
    "$... + #{ sumando } = #{ suma }$"
  when :segundo
    "$#{ sumando } + ... = #{ suma }$"
  end
end

def resta_de_positivos
  minuendo = rand(1..5)
  sustraendo = minuendo + rand(2..8)
  "$#{ minuendo } - #{ sustraendo } = ...$"
end

def suma_de_negativo_y_positivo
  "$-#{ rand(3..12) } + #{ rand(3..9) } = ...$"
end

def operaciones_combinadas dificultad
  producto = "#{ rand(2..6) } \\cdot #{ rand(2..7) }"
  suma = "#{ rand(1..12) } + #{ rand(1..12) }"
  potencia = "#{ rand(2..6) }^#{ rand(2..3) }"
  case dificultad
  when 1
    "$#{ rand(1..8) } + #{ producto } = ...$"
  when 2
    "$#{ producto } + #{ producto } = ...$"
  when 3
    "$#{ rand(1..5) } \\cdot ( #{ suma } ) - #{ rand(2..15) } = ...$"
  when 4
    "$#{ potencia } + #{ rand(2..15) } = ...$"
  when 5
    "$#{ rand(3..15) } + #{ rand(2..4) } \\cdot #{ potencia } = ...$"
  end
end
