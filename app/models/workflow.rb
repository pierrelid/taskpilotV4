class Workflow < ApplicationRecord
  belongs_to :list
  belongs_to :user

  has_many :steps, dependent: :destroy
  has_many :list_lines, through: :list

  validates :name, presence: true

  def update_waiting_list_lines
    list_lines = self.list_lines.where(finish: false, waiting: true)
    list_lines.each do |list_line|
      update_condition = (DateTime.now.to_i - list_line.waiting_start.to_i) >= list_line.seconds_to_wait
      list_line.update(waiting: false, seconds_to_wait: 0, waiting_start: nil) if update_condition
    end
  end
end
