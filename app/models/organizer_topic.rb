class OrganizerTopic < ApplicationRecord
  belongs_to :topic
  belongs_to :organizer
end
