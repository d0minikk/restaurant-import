FactoryGirl.define do
  factory :dish_import_row, class: Importers::DishForm do
    id { Random.rand(100) }
    name { FFaker::Name.unique.name }
    description 'description'
    menus_appeared { Random.rand(100) }
    times_appeared { Random.rand(100) }
    first_appeared { Time.zone.now }
    last_appeared { Time.zone.now }
    lowest_price { Random.rand(100) }
    highest_price { Random.rand(100) }

    skip_create
  end
end
