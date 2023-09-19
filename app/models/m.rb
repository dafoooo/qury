module M
  extend ActiveSupport::Concern

  class << self
    def table_name_prefix
      "m_"
    end
  end
end
