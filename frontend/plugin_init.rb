Rails.application.config.after_initialize do
  module SearchHelper

    class SearchColumn
      alias_method :class_orig, :class

      def class
        class_orig

        fld = field || ''

        # matching the serious dodginess in the core implementation of this
        @classes << ' non-wrapping' if fld.include?('date') || fld.include?('ident') || fld.include?('status')
        @classes
      end
    end
  end
end

