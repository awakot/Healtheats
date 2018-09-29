json.data(@data) { |d| json.extract!(d, :name, :description, :price, :kcalorie) }
