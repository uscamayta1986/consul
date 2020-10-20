module TranslatorText
  module Types
    class TranslationResult < Dry::Struct
      include Types::JSON

      transform_keys(&:to_sym)

      attribute :translations, Types::Array.of(Translation)
      attribute :detectedLanguage, Types::Hash.default({})

      # Returns the detected language
      #
      # @return [Symbol] the language
      def detected_language
        if h = detectedLanguage['language']
          h.to_sym
        end
      end
    end
  end
end
