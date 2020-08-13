class IndexerCommon
  add_indexer_initialize_hook do |indexer|
    indexer.add_document_prepare_hook {|doc, record|
      if doc['primary_type'] == 'accession'
        if cm = record['record']['collection_management']
          doc['processing_status_u_ssort'] = cm['processing_status']
        end
      end
    }
  end
end
