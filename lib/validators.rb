module Validators
  module ValueCheck
    def has_a_name
      if nil_or_empty(english_name) && nil_or_empty(welsh_name)
        errors[:base] << "Must have a name"
      end
    end

    def only_inactive_if_not_used
      if inactive && self.the_collection.where(self.the_attribute => id).count > 0
        errors[:base] << self.the_error
      end
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
