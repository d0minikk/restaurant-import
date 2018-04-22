FactoryGirl.define do
  factory :menu_page_import_row, class: Importers::MenuPageForm do
    id { Random.rand(100) }
    menu_id { Random.rand(100) }
    page_number { Random.rand(100) }
    image_id { Random.rand(100) }
    full_height { Random.rand(100) }
    full_width { Random.rand(100) }
    uuid { FFaker::Guid.guid }

    skip_create
  end
end
