class RecallDetail < ActiveRecord::Base
  belongs_to :recall
  attr_accessible :detail_type, :detail_value
  validates_presence_of :detail_type, :detail_value
  validates_uniqueness_of :detail_value, scope: [:recall_id, :detail_type], case_sensitive: false
  before_save :sanitize_string_fields

  private
  def sanitize_string_fields
    self.detail_value = StringSanitizer.sanitize(detail_value)
  end
end
