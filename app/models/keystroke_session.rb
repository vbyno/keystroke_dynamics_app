class KeystrokeSession < ApplicationRecord
  require 'csv'

  ATTRIBUTES = {
    id: 'attempt_id',
    text: 'ReviewText',
    keystrokes: 'ReviewMeta',
    user_uuid: 'AccessKey',
    created_at: 'ReviewDate'
  }.freeze

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << ATTRIBUTES.values

      all.each do |keystroke_session|
        csv << keystroke_session.attributes.symbolize_keys.values_at(*ATTRIBUTES.keys)
      end
    end
  end
end
