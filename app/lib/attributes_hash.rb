module AttributesHash
  extend ActiveSupport::Concern

  class_methods do
    def attr_accessor(*args)
      @attributes = args
      super(*args)
    end

    def attributes
      @attributes
    end
  end

  included do
    def to_hash
      self.class.attributes.inject({}) do |hash, key|
        hash.merge({ key => self.send(key) })
      end
    end
  end
end
