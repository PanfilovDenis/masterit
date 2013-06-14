#coding: UTF-8
class UserReport
  
  include Skeptick
  
  def png_filename(model)
      "report.png"
  end
  
  def generate_png(model)
    
    image_size = '1170x1700'
    left, top  = 500, 800

    # Build a picture with built-in tile:granite: texture and using the
    # skeptick-provided sugar method `rounded_corners_image`
    
    paper = image do
      #set   :size, image_size
      image "#{Rails.root}/vendor/assets/images/bg.png"
      #apply '-brightness-contrast', '38x-33'
      #apply :blur, '0x0.5'
    end

    # Build a text image that says "Skeptick" using specified font, add gradient
    text = image do
      canvas :none, size: '1000x1000'
      font   'Handwriting - Dakota Regular'
      set    :pointsize, 40
      set    :fill, 'gradient:#37e-#007'
      write  'удостоверяет, что проект', left: 360, top: 442
      write  "#{model.name}", left: 470, top: 528
      write  'принял участие в региональном конкурсе', left: 198, top: 704
      write  'компьютерного творчества детей и юношества', left: 150, top: 748
      write  'Мастер ИТ-2013', left: 420, top: 790
      write  'Автор/ы:', left: 508, top: 871
      write  "#{model.user.first_name} #{model.user.last_name}, #{model.region.name}", left: 363, top: 916
      write  'Научный/е руководитель/ли:', left: 340, top: 1000
      #write  'ФИО', left: 546, top: 1044
      write  'Номер проекта', left: 443, top: 1141
      write  "в Едином Реестре Проектов: #{model.id}", left: 250, top: 1186
      apply  :blur, '0x0.7'
    end

    #bezier = \
    #  "#{left + 17 }, #{top + 17}   #{left + 457}, #{top - 13} " +
    #  "#{left + 377}, #{top + 27}   #{left + 267}, #{top + 27}"
    
    
    # Draw a curve that will appear underneath the text using bezier coordinates
    #curve = image do
    #  canvas :none, size: '395x110'
    #  set    :strokewidth, 2
    #  set    :stroke, 'gradient:#37e-#007'
    #  draw   "fill none bezier #{bezier}"
    #end

    # Combine text and curve using `:over` blending, multiply it with paper using
    # `:multiply` blending, and add a torn effect using Skeptick-provided sugar
    # method `torn_paper_image`
    torn = torn_paper_image(
      paper * text ,
      #spread: 50,
      blur:   '3x10'
    )

    # Create a convert command with all of the above and run it
    logo = convert(torn, to: "#{Rails.root}/vendor/assets/images/report.png")
    logo.build
    open("#{Rails.root}/vendor/assets/images/report.png").read
  end
  # This is what the resulting command looks like
  # You can see it by running `logo.to_s`
  #
  # convert (
  #   (
  #     (
  #       -size 400x120 tile:granite:
  #       -brightness-contrast 38x-33 -blur 0x0.5
  #       (
  #         +clone -alpha transparent -background none
  #         -draw roundrectangle 1,1 400,120 25,25
  #       )
  #       -alpha set -compose dstin -composite
  #     )
  #
  #     (
  #       -size 395x110 canvas:none
  #       -font Handwriting---Dakota-Regular -pointsize 90
  #       -fill gradient:#37e-#007 -draw text 8,80 'Skeptick'
  #       -blur 0x0.7 -size 395x110 canvas:none -strokewidth 2
  #       -stroke gradient:#37e-#007
  #       -draw fill none
  #         bezier 25, 97   465, 67 385, 107   275, 107
  #       -compose over -composite
  #     )
  #
  #     -compose multiply -composite
  #   )
  #
  #   (
  #     +clone -alpha extract -virtual-pixel black -spread 50
  #     -blur 0x3 -threshold 50% -spread 1 -blur 0x.7
  #   )
  #
  #   -alpha off -compose copy_opacity -composite
  # ) logo.png
#  def pdf_filename(model)
#    "#{model.name}.pdf"
#  end

#  def initialize_fonts
#    font_path = Rails.root.join('vendor', 'fonts')
#    font_families.update("Verdana" => {
#      :bold => "#{font_path}/verdanab.ttf",
#      :italic => "#{font_path}/verdanai.ttf",
#      :normal  => "#{font_path}/verdana.ttf" })
#    font "Verdana", :size => 10
#    @bg = "#{Rails.root}/vendor/assets/images/bg.png"
#  end
#  def create_title
#    text "header", size: 12, style: :italic, align: :left
#  end
#  def create_body
#    image @bg,
#      :at  => [0, Prawn::Document::PageGeometry::SIZES["A4"][1]],
#      :fit => Prawn::Document::PageGeometry::SIZES["A4"]
#    text "This is pdf with background image ready to fill in"
#  end
#  def create_footer(url)
#    page_count.times do |i|
#      go_to_page(i + 1)
#      bounding_box [bounds.left, bounds.bottom + 15], width: bounds.width do
#        move_down(5)
#        text url, align: :right, size: 8
#      end
#    end
#  end
#  def generate_pdf(url)
#    initialize_fonts
#    create_title
#    #create_header
#    create_body
#    create_footer(url)
#    render
#  end
end
