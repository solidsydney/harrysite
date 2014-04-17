class ContactImport
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  validates :file, presence: true

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
     load_imported_contacts
  end

  def imported_contacts
    @imported_contacts ||= load_imported_contacts
  end

  def load_imported_contacts
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (1..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      contact = Contact.new
      contact.email = spreadsheet.cell(i,'A')
      contact.name = spreadsheet.cell(i,'B')
      contact
      ImportWorker.perform_in(5.minutes, contact.email)
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end