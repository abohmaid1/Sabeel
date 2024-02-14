class TelegramWebhooksController < ApplicationController
    include Telegram::Bot::UpdatesController
  
    def message(message)
      # Your code to handle incoming messages
    end
  end