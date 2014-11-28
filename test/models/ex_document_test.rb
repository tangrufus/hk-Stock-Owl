# == Schema Information
#
# Table name: ex_documents
#
#  id               :integer          not null, primary key
#  title            :text             default(""), not null
#  link             :text             default("http://www.hkexnews.hk/"), not null
#  short_link       :text             default("")
#  stock_company_id :integer
#  released_at      :datetime         not null
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_ex_documents_on_stock_company_id  (stock_company_id)
#

require 'test_helper'

class ExDocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
