class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    sprintf('%.2f', object)
  end
end
