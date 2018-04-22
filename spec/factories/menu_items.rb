FactoryGirl.define do
  factory :menu_item_import_row, class: Importers::MenuItemForm do
    id { Random.rand(100) }
    menu_page_id { Random.rand(100) }
    price { Random.rand(100) }
    high_price { Random.rand(100) }
    dish_id { Random.rand(100) }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
    xpos { Random.rand(100) }
    ypos { Random.rand(100) }

    skip_create
  end
end
