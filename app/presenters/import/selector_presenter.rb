class Import::SelectorPresenter
  class << self
    def task_types
      RestaurantImportConfig.importer_types
    end
  end
end
