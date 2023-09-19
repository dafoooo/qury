class M::Color < ::ApplicationRecord
  include M

  COLOR_PALETTE = {
    bittersweet: "ff595e",
    atomic_tangerine: "ff924c",
    sunglow: "ffca3a",
    pear: "c5ca30",
    yellow_green: "8ac926",
    dark_cyan: "36949d",
    steel_blue: "1982c4",
    true_blue: "4267ac",
    ultra_violet: "565aa0",
    ultra_violet_2: "6a4c93"
  }

  has_many :property_items
  has_many :topic_groups
  has_many :categories
end
