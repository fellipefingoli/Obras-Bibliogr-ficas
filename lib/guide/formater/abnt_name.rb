module Guide
  module Formater
    class AbntName
      class << self
        RGX = /^(filho|filha|neto|neta|sobrinho|sobrinha|junior)$/
        RGX2 = /^(da|de|do|das|dos)$/

        def call(*args)
          name = args.join(" ")
          @first_part = @second_part = ''
          splited_name = name.split(" ").map(&:downcase)
          parse_words(splited_name)

          splited_name.size == 1 ? @first_part.strip : "#{@first_part.strip}, #{@second_part.strip}"
        end

        private
          def parse_words(splited_name)
            splited_name.each_with_index do |v,k|
              if (splited_name.size > 2 && k == splited_name.size - 2 && splited_name[k+1].match?(RGX)) 
                @first_part += v.upcase + ' '
              elsif k == splited_name.size - 1 
                @first_part += v.upcase + ' '
              elsif !v.match?(RGX2) 
                @second_part += v.capitalize + ' '
              else
                @second_part += v + ' '
              end 
            end
          end
      end
    end
  end
end