FactoryGirl.define do
  factory :menu_import_row, class: Importers::MenuForm do
    id { Random.rand(100) }
    name { FFaker::Name.unique.name }
    sponsor { FFaker::Name.unique.name }
    event { FFaker::Name.unique.name }
    venue { FFaker::Name.unique.name }
    place { FFaker::Name.unique.name }
    physical_description 'description'
    occasion { FFaker::Name.unique.name }
    notes 'notes'
    call_number { FFaker::PhoneNumber.phone_number }
    keywords { FFaker::BaconIpsum.words }
    language 'en'
    date { Time.zone.now }
    location { FFaker::Name.unique.name }
    location_type { FFaker::Name.unique.name }
    currency { FFaker::Currency.code }
    currency_symbol { FFaker::Currency.code }
    status 'complete'
    page_count { Random.rand(100) }
    dish_count { Random.rand(100) }

    skip_create
  end
end
