module IndividualItems
  class AddToCart
    include Interactor::Organizer

    organize Details::CalculatePriceSvg, IndividualItems::SaveInCart
  end
end
