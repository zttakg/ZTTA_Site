module ServicesHelper
  ROUND_SCALE = 2
  BORDER_SIZE = 1

  def round(value)
    rounded_value = value.to_f.round(ROUND_SCALE)
    i, f = rounded_value.to_i, rounded_value.to_f
    i == f ? i : f
  end
end
