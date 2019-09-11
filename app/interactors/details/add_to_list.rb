module Details
  class AddToList
    include Interactor::Organizer

    organize Details::CalculatePrice, Details::Save
  end
end
