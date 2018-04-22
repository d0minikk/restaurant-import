class Importers::BaseForm
  include ActiveModel::Model
  include AttributesHash

  def attributes
    to_hash
  end
end
