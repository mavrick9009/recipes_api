module STIPredicateable
  extend ActiveSupport::Concern

  def method_missing(name, *args, &block)
    if type_predicate_match?(name)
      self.class.class_eval do
        define_method(name) do
          name.to_s == "#{type.underscore}?"
        end
      end

      send(name)
    else
      super
    end
  end

  def respond_to_missing(name, include_private=false)
    type_predicate_match?(name) or super
  end

  private

  def type_predicate_match?(name)
    self.class.base_class.subclasses.find { |sc|
      name.to_s.include?(sc.new.type.underscore)
    }
  end
end
