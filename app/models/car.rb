class Car < ActiveRecord::Base
  VALID_CARS_NUMBER = /[A-Z]{2}[\d]{4}[A-Z]{2}/
  VALID_VIM_NUM_REGEX = /\w{15,20}/
  VALID_CREW_NAME = /[0-9]{4}/

  validates :car_number,
          presence: { message: " не може бути порожньою" } ,
          uniqueness:  {case_sensitive: false, message: " вже зареєстровано"},
          format: { with: VALID_CARS_NUMBER, message: "має неправильний формат" }

  validates :vin_number,
          presence: { message: " не може бути порожнім" },
          uniqueness:  {case_sensitive: false, message: " вже зареєстровано"},
          format: { with: VALID_VIM_NUM_REGEX, message: "має неправильний формат" }

  validates :crew_name,
          presence: { message: " не може бути порожнім" },
          uniqueness:  {case_sensitive: false, message: " вже зареєстровано"},
          format: { with: VALID_CREW_NAME, message: "має неправильний формат" }
end
