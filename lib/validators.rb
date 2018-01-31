module Validators
  module ValueCheck
    def a_name?
      return unless nil_or_empty(english_name) && nil_or_empty(welsh_name)
      errors.add(:base, :no_name)
    end

    def only_inactive_if_not_used
      return unless inactive && the_collection.where(the_attribute => id).count.positive?
      errors.add(:base, :item_in_use)
    end

    private

    def nil_or_empty(x)
      if x.nil?
        true
      elsif x.empty?
        true
      else
        false
      end
    end
  end
end
