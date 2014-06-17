# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index    
  	if params[:round].nil?
	  @game = Game.new(ip: request.remote_ip)
	  @round = @game.rounds.build
	  @game.save
	else
	  @round = Round.find(params[:round])
  	end

    @letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    
    word = Word.find(:all).shuffle!.first.word
    
    @right_letters = @round.right_letters
    @wrong_letters = @round.wrong_letters

	if @right_letters.nil?
	  @right_letters = ''
	end

	if @wrong_letters.nil?
	  @wrong_letters = ''
	end

    max_tries = 6

    input_letter = params[:guess]

    if input_letter.present?
      @letters.delete(input_letter)
      count = 0
	  word.split("").each do |word_letter|
	   	count += 1
	    if word_letter == input_letter
	 	  @right_letters += input_letter
	  	  break
	    else
	  	  if count >= word.length
	        @wrong_letters += input_letter
     	  else
		    next
		  end
	    end
	  end
	  @round.wrong_letters = @wrong_letters
	  @round.right_letters = @right_letters	  
	  @round.save
	end

  	respond_to do |format|
      format.html
    end
  end

private
  	def check_win(word_array)
  	  win = false

  	end
end