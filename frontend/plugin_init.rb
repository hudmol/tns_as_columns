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

  class SearchResultData

    class << self
      alias_method :tns_as_columns_RESOURCE_FACETS_orig, :RESOURCE_FACETS
    end

    def self.RESOURCE_FACETS
      tns_as_columns_RESOURCE_FACETS_orig + ['extent_sort_type_u_sstr']
    end

    alias_method :tns_as_columns_facet_label_string_orig, :facet_label_string

    def facet_label_string(facet_group, facet)
      if facet_group == "extent_sort_type_u_sstr"
        I18n.t("enumerations.extent_extent_type.#{facet}", :default => facet)
      else
        tns_as_columns_facet_label_string_orig(facet_group, facet)
      end
    end

  end

end

