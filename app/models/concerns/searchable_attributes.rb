module SearchableAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    def search_for_in(term, attribute)
      attribute = attribute.to_s #make sure attributes passed as symbol eval as string
      if self.attribute_names.include?(attribute)
        return self.where("#{attribute} LIKE ?", "%#{term}%")
      end
    end
  end
end
