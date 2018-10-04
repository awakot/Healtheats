json.data(@data) { |d| json.extract!(d, :name, :zip_code, :address) }
