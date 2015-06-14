class CustomField < ActiveRecord::Base
  default_scope { order(:order) }

  acts_as_paranoid
  has_paper_trail
  belongs_to :project_reward
  has_many :custom_field_options, dependent: :destroy

  accepts_nested_attributes_for :custom_field_options, allow_destroy: true

  mount_uploader :cover, CoverUploader

  validates :name, presence: true
  validates :order, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality
  validates :field_type, presence: true
  validate :check_options_if_select_box
  validate :check_number_field_if_price_setted

  enum field_type: [:text, :select_box, :number_field]

  def check_options_if_select_box
    if select_box?
      custom_field_options.size > 1 ? true : errors.add("#{self.name}欄位", "須有兩個以上的選項")
      custom_field_options.size <= 5 ? true : errors.add("#{self.name}欄位", "不能超過五個選項")
    end
  end

  def check_number_field_if_price_setted
    if price.to_i != 0
      self.number_field? ? true : errors.add("#{self.name}欄位", "若售價不為0，則輸入欄需為數字")
    end
  end
end
