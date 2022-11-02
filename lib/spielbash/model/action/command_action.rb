module Spielbash
  class CommandAction < Spielbash::BaseAction
    attr_accessor :command

    def initialize(command, action_context)
      super(action_context)
      @command = command
    end

    def execute(session)
      command.each_char do |c|
        session.send_key(c)
        sleep(action_context.typing_delay_s)
      end
      sleep(action_context.reading_delay_s)
      session.send_key('C-m')

      session.wait if action_context.wait
    end
  end
end