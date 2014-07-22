require 'erb'

module Examinator
  def self.build template
    erb = ERB.new(File.read(template), nil, '<>')
    output_file = File.basename template, '.erb'
    output_text = erb.result
    File.write output_file, output_text
    puts output_text
  end
end
