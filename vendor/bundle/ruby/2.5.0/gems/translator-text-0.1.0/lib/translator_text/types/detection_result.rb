module TranslatorText
  module Types
    class DetectionResult < Dry::Struct
      include Types::JSON

      transform_keys(&:to_sym)

      attribute :language, Types::Symbol
      attribute :score, Types::Float
      attribute :isTranslationSupported, Types::Bool
      attribute :isTransliterationSupported, Types::Bool

      attribute :alternatives, Types::Array.of(Alternative)
    end
  end
end
