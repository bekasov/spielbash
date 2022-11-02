module Spielbash
  class ReadFileAction < Spielbash::BaseAction
    attr_accessor :filePath

    def initialize(file_path, action_context)
      super(action_context)
      @filePath = file_path
    end

    def execute(session)
      File.open(filePath, "r").each_line do |row|
        row.each_char do |c|
          session.send_key(c)
          sleep(action_context.typing_delay_s)
        end
          session.send_key('Enter')
      end
      sleep(action_context.reading_delay_s)
    end
  end
end
