class Event < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, :presence => {:message => "title cannot be blank"}, :uniqueness => {:message => "title has already been taken"}
  validates :date, :presence => {:message => "must choose valid date"}, format:{with:/\d{4}-[01]\d+-[0123]\d+/, message: "date must be MM/DD/YYYY format"}
  validates :organizer_email, format: {with: /.+@.+\..{2,3}/,message: "must be x@x.x format" }
  validates :organizer_name, :presence => {:message => "name cannot be blank"}
   validate :date_validator

  

  def date_validator
    errors.add(:date_past, "cant be in the past") if date < Date.today
  end
 
end
