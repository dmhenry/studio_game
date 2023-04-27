# frozen_string_literal: true

module StudioGame
  module Auditable
    def audit
      puts "Rolled a #{self.number} (#{self.class})"
    end
  end
end
