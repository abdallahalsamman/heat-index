module HeatIndex
  class HeatIndex
    def initialize(temperature: nil, humidity: nil)
      @temperature = temperature   # temperature degree
      @humidity = humidity         # percentage e.g. 0 < @humidity < 100
    end

    def calculate
      # Creating multiples of 'fahrenheit' & 'hum' values for the coefficients
      f = @temperature.as_f.value
      t = f ** 2
      h = @humidity ** 2

      # Coefficients for the calculations
      c = [-42.379, 2.04901523, 10.14333127, -0.22475541, -6.83783e-03, -5.481717e-02, 1.22874e-03, 8.5282e-04, -1.99e-06]

      # Calculating heat-index
      heatindex =
          c[0] +
          (c[1] * f) +
          (c[2] * @humidity) +
          (c[3] * f * @humidity) +
          (c[4] * t) + (c[5] * h) +
          (c[6] * t * @humidity) +
          (c[7] * f * h) +
          (c[8] * t * h)

      Fahrenheit.new(heatindex)
    end
  end

  class Degree
    attr_accessor :value

    def initialize(value)
      self.value = value
    end

    def rounded_value
      value.round
    end
  end

  class Celsius < Degree
      def as_f
          Fahrenheit.new(value * (9.0 / 5.0) + 32)
      end

      def as_c
          self
      end

      def as_k
          Kelvin.new(value + 273)
      end
  end

  class Kelvin < Degree
      def as_f
          self.as_c.as_f	
      end

      def as_c
          Celsius.new(value - 273)
      end

      def as_k
          self
      end
  end

  class Fahrenheit < Degree
      def as_f
          self
      end

      def as_c
          Celsius.new((5 * (value - 32)) / 9)
      end

      def as_k
          self.as_c.as_k
      end
  end
end
