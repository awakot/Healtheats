json.data(@data) { |d| json.extract!(d, :name, :description, :price, :calorie_id, :picture) }
