class Car < ActiveRecord::Base
  VALID_CARS_NUMBER = /[A-Z]{2}[\d]{4}[A-Z]{2}/
  VALID_VIM_NUM_REGEX = /\w{15,20}/
  VALID_CARS_NAME = /[0-9]{4}/

  validates :car_number,
          presence: { message: " не може бути порожньою" } ,
          uniqueness:  {case_sensitive: false, message: " вже зареєстровано"},
          format: { with: VALID_CARS_NUMBER, message: "має неправильний формат" }

  validates :vin_number,
          presence: { message: " не може бути порожнім" },
          uniqueness:  {case_sensitive: false, message: " вже зареєстровано"},
          format: { with: VALID_VIM_NUM_REGEX, message: "має неправильний формат" }

  validates :car_name,
          presence: { message: " не може бути порожнім" },
          uniqueness:  {case_sensitive: false, message: " вже зареєстровано"},
          format: { with: VALID_CARS_NAME, message: "має неправильний формат" }

  def self.extract_car name, vin, number
    find_by("car_number = ? AND vin_number = ? AND car_name = ?", number, vin, name)
  end
end
