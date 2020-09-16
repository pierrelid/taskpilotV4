class Workflow < ApplicationRecord
  belongs_to :list
  belongs_to :user

  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  has_many :list_lines, through: :list
  has_many :active_list_lines, -> { where(finish: false, waiting: false) }, through: :list, source: :list_lines

  validates :name, presence: true

  def update_waiting_list_lines
    list_lines = self.list_lines.where(finish: false, waiting: true)
    list_lines.each do |list_line|
      update_condition = (DateTime.now.to_i - list_line.waiting_start.to_i) >= list_line.seconds_to_wait
      list_line.update(waiting: false, seconds_to_wait: 0, waiting_start: nil) if update_condition
    end
  end

  def execution
    return unless self.active
    steps = self.steps
    list_lines = self.active_list_lines
    list_lines.each do |list_line|
      if list_line.step.nil?
        list_line.update(step: steps.first)
        list_line.step_execution
      else
        current_step = list_line.step
        next_step = steps.find_by(position: current_step.position + 1)
        if next_step.present?
          list_line.update(step: next_step)
          list_line.step_execution
        else
          list_line.update(step: nil, finish: true, waiting: false)
        end
      end
    end
  end
end
