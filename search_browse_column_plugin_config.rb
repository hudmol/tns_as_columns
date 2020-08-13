module SearchAndBrowseColumnPlugin
  def self.config
    {
      'accession' => {
        :add => {
          'processing_status' => {
            :field => 'processing_status_u_ssort',
            :sortable => true,
            :locale_key => 'enumerations.collection_management_processing_status',
          }
        },
      }
    }
  end
end
