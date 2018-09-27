json.data(@menus) { |d| json.extract!(d, :name, :description, :price, :kcalorie) }
