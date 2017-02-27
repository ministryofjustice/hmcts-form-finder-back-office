module SoftDeletion
  module Collection
    def active
      where(inactive: false)
    end

    def inactive
      where(inactive: true)
    end
  end

  module Record
    def activate!
      update(inactive: false)
    end

    def deactivate!
      update(inactive: true)
    end
  end
end
