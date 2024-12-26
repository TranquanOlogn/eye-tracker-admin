class Device < ApplicationRecord
    has_one_attached :log_file
end