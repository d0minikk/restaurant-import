class RestaurantImportConfig
  class << self
    def importer_types
      ['Dishes', 'MenuItems', 'MenuPages', 'Menus']
    end
  end
end
