class Thumbnailize < Nanoc3::Filter

  identifier :thumbnailize
  type       :binary

  def run(filename, params={})
    system(
      'convert',
      '-resize',
      params[:width].to_s + "x" + params[:height].to_s + ">",  # '>' makes sure we don't enlarge the image!
      filename,
      output_filename
    )
  end

end
