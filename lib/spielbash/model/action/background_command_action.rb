module Spielbash
  class BackgroundCommandAction < Spielbash::BaseAction
    attr_accessor :command

    def initialize(command, action_context)
      super(action_context)
      @command = command
    end

    def execute(session)
      session.execute_with_exactly('tmux', action_context.wait, false, true, '-c', command)
    end
  end
end
