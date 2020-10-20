module Dry
  module Types
    module BuilderMethods
      # @api private
      def included(base)
        super
        base.extend(BuilderMethods)
      end

      # Build an array type.
      # It is a shortcut for Array.of
      #
      # @example
      #   Types::Strings = Types.Array(Types::String)
      #
      # @param [Dry::Types::Type] type
      #
      # @return [Dry::Types::Array]
      def Array(type)
        self::Array.of(type)
      end

      # Build a hash schema
      #
      # @param [Symbol] schema Schema type
      # @param [Hash{Symbol => Dry::Types::Type}] type_map
      #
      # @return [Dry::Types::Array]
      # @api public
      def Hash(schema, type_map)
        self::Hash.public_send(schema, type_map)
      end

      # Build a type which values are instances of a given class
      # Values are checked using `is_a?` call
      #
      # @example
      #   Types::Error = Types.Instance(StandardError)
      #   Types::Error = Types.Strict(StandardError)
      #   Types.Strict(Integer) == Types::Strict::Int # => true
      #
      # @param [Class,Module] klass Class or module
      #
      # @return [Dry::Types::Type]
      # @api public
      def Instance(klass)
        Definition.new(klass).constrained(type: klass)
      end
      alias_method :Strict, :Instance

      # Build a type with a single value
      # The equality check done with `eql?`
      #
      # @param [Object] value
      #
      # @return [Dry::Types::Type]
      # @api public
      def Value(value)
        Definition.new(value.class).constrained(eql: value)
      end

      # Build a type with a single value
      # The equality check done with `equal?`
      #
      # @param [Object] object
      #
      # @return [Dry::Types::Type]
      # @api public
      def Constant(object)
        Definition.new(object.class).constrained(is: object)
      end

      # Build a constructor type
      # If no constructor block given it uses .new method
      #
      # @param [Class] klass
      # @param [#call,nil] cons Value constructor
      # @param [#call,nil] block Value constructor
      #
      # @return [Dry::Types::Type]
      # @api public
      def Constructor(klass, cons = nil, &block)
        Definition.new(klass).constructor(cons || block || klass.method(:new))
      end

      # Build a definition type
      #
      # @param [Class] klass
      #
      # @return [Dry::Types::Type]
      # @api public
      def Definition(klass)
        Definition.new(klass)
      end

      # Build a map type
      #
      # @example
      #   Types::IntMap = Types.Map(Types::Strict::Integer, 'any')
      #   Types::IntStringMap = Types.Map(Types::Strict::Integer, Types::Strict::String)
      #
      # @param [Type] key_type Key type
      # @param [Type] value_type Value type
      #
      # @return [Dry::Types::Map]
      # @api public
      def Map(key_type, value_type)
        Types['hash'].map(key_type, value_type)
      end
    end
  end
end
