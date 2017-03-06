module Validators
  module ValueCheck

    def has_a_name
      if nil_or_empty(english_name) && nil_or_empty(welsh_name)
        errors[:base] << "Must have a name"
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
