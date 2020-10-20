module TranslatorText
  module Types
    class Alternative < Dry::Struct
      include Types::JSON

      transform_keys(&:to_sym)

      attribute :language, Types::Symbol
      attribute :score, Types::Float
      attribute :isTranslationSupported, Types::Bool
      attribute :isTransliterationSupported, Types::Bool
    end
  end
end
