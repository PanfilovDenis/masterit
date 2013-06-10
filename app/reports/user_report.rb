class UserReport < Prawn::Document

  def pdf_filename(model)
    "#{sanitize(model.name)}.pdf"
  end

  def initialize_fonts
    font_path = Rails.root.join('vendor', 'fonts')
    font_families.update("Verdana" => {
      :bold => "#{font_path}/verdanab.ttf",
      :italic => "#{font_path}/verdanai.ttf",
      :normal  => "#{font_path}/verdana.ttf" })
    font "Verdana", :size => 10
    @bg = "#{RAILS_ROOT}/vendor/assets/images/bg.png"
  end
  def create_title
    text header, size: 12, style: :italic, align: :left
  end
  def create_body
    pdf.image bg,
      :at  => [0, Prawn::Document::PageGeometry::SIZES["A4"][1]],
      :fit => Prawn::Document::PageGeometry::SIZES["A4"]
    pdf.text "This is pdf with background image ready to fill in"
  end
  def create_footer(url)
    page_count.times do |i|
      go_to_page(i + 1)
      bounding_box [bounds.left, bounds.bottom + 15], width: bounds.width do
        move_down(5)
        text url, align: :right, size: 8
      end
    end
  end
  def generate_pdf(url)
    initialize_fonts
    create_title
    create_header
    create_body
    create_footer(url)
    render
  end
end
