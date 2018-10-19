class Api::ImageUploadersController < ApplicationController
  def create
    pic = params[:picture]
    pic_name = pic.original_filename
    pic_path = Rails.root.join("public/uploads/", pic_name)
    File.open(pic_path, "w+b") do |f|
      f.write pic.read
    end
    uploaded_pic_path = "/uploads/" + pic_name
    render json: { file_path: uploaded_pic_path }, status: :ok
  end
end
