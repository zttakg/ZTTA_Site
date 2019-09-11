class InvoicePdf < Prawn::Document
  def initialize(individual_items, individual_order)
    super()

    @individual_items = individual_items
    @individual_order = individual_order
    header
    text_content
    table_content
  end

  def header
    bold_font = Rails.root.join('app','assets','fonts', 'lato', 'bold.ttf')
    regular_font = Rails.root.join('app','assets','fonts', 'lato', 'regular.ttf')
    font_families.update(
      "Font" => {
        :bold => bold_font,
        :normal  => regular_font })

    font "Font", :size => 10
  end

  def text_content
    y_position = cursor - 50
    z = cursor - 100

    bounding_box([30, y_position], width: 500, height: 15) do
      date = @individual_order.created_at.strftime('%d.%m.%Y')
      text "Товарно-транспортная накладная          от #{date}, заказ #{@individual_order.id}", size: 15, style: :bold
    end

    bounding_box([200, y_position], width: 500, height: 15) do
      horizontal_line 100, 70, at: 0
    end

    bounding_box([30, z], width: 50, height: 30) do
      text "№ Авто ", size: 10
      horizontal_line 100, 40, at: 20
    end

    bounding_box([270, z], width: 100, height: 30) do
      horizontal_line 200, 40, at: 20
    end
  end

  def table_content
    table individual_items_rows do
      row(0).font_style = :bold
      row(0).size = 12
      row(0).align = :center

      cells.align = :center
      self.column_widths = [70, 160, 65, 65, 80, 80]
    end

    table([['ИТОГО:', '', '', '', '']], :column_widths => [230, 65, 65, 80, 80], cell_style: {font_style: :bold, size: 12})
    table([['Предоплата', 'Наличные', 'Долг', 'Нал./Безнал.']], column_widths: [130, 130, 130, 130], cell_style: {height: 40, font_style: :bold, size: 12})
    table([['Менеджер', 'Завсклад', 'Бухгалтер', 'Кассир']], column_widths: [130, 130, 130, 130], cell_style: {font_style: :bold, size: 12})
    table([['Получил']], column_widths: [520], cell_style: {font_style: :bold, size: 12})
  end

  def individual_items_rows
    [['№', 'Наименование', 'Кол-во к отгрузке шт/кг', 'Факт. кол-во шт/кг','Цена за шт/кг, сом', 'Сумма, сом']] +
      @individual_items.map do |individual_item|
      [individual_item.id, individual_item.material_name, individual_item.count, '', individual_item.price.to_f, individual_item.count * individual_item.price.to_f]
    end
  end
end
