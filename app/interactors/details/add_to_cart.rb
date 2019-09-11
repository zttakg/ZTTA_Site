module Details
  class AddToCart
    include Interactor::Organizer

    organize Details::CalculatePrice, Details::SaveInCart
  end
end
