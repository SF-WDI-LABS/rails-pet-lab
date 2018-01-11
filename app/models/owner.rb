class Owner < ActiveRecord::Base
  # TODO: add association ot pets
  has_many :pets

  # TODO: add association to appointments (through pets)
  
  # TODO: add validations
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true, format: { with: /@/, message: "must include @" }

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
    if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[()-.]/,"")
    end
  end

end
