# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  before_filter :fetch_game, :fetch_won, :fetch_guess

  def index
  	# recebe o chute do usuário
  	# remove o chute da lista de letras
  	# checa se o chute está na palavra
  	  # se está, coloca o chute na lista de  letras corretas e a posiciona na string de impressão
  	  # se não está, coloca o chute na lista de letras incorretas
  	# checa a vitória e abre um novo round para o usuário

    if @guess.present? && @round_id == @round.id
      unless @round.wrong_letters.include?(@guess) || @round.right_letters.include?(@guess)
        if @correct_word.include? @guess
          @round.right_letters += @guess
        else
          @round.wrong_letters += @guess
        end
      end
      check_win
      @round.save
    end

  	respond_to do |format|
      format.html
    end
  end

private

    # traz um jogo salvo pelo token. se não houver, pelo ip. se não houver, cria um novo
  	def fetch_game()
  	  if params[:token].present?
	    @game = Game.find_by_token(params[:token])
	    @round = @game.rounds.where(win: nil).last
	  elsif Game.exists?(ip: request.remote_ip)
	  	# create new game?
	  	@game = Game.where(ip: request.remote_ip).last
	  	@round = @game.rounds.where(win: nil).last
	  else
	    @game = Game.new(ip: request.remote_ip)
	    @round = @game.rounds.build
	    @game.save
  	  end
  	  @correct_word = @round.word.word if @round.word.present?
  	end

    def fetch_won()
      @won_rounds = @game.rounds.where(win: true).order(:created_at)
    end

  	# recebe o chute do usuário e modifica o jogo com ele
  	def fetch_guess()
      @guess = params[:guess]
      @round_id = params[:round].to_i
      @guess.upcase! if @guess.present?
  	end

  	# checa se o usuário venceu e abre um novo round
  	def check_win()
  	  if @round.wrong_letters.length >= Clicplic::Application.config.max_tries
  	  	@round.win = false
  	  else
  	  	len = @correct_word.length
  	  	@correct_word.split("").each_with_index do |l, i|
          break unless @round.right_letters.include? l
          @round.win = true if (i+1 == len)
        end
      end
  	end
end