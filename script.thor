class Word < Thor
  desc 'disorder FILE', "Disorder lines in the file then output them"
  method_options %w( output -o ) => :string
  def disorder file
    out = if options[:output] then File.open(options[:output], 'w+')
          else                     STDOUT
          end
    File.read(file).split("\n").delete_if do |line|
      line.nil? || line.strip.size == 0
    end.map(&:strip).sort_by{rand}.each {|line| out.puts line }

    out.close if out != STDOUT
  end
end
