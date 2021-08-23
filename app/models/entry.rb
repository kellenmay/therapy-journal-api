class Entry < ApplicationRecord
    belongs_to: User
    belongs_to: Journal
end
