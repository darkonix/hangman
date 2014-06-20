# -*- encoding : utf-8 -*-
module ApplicationHelper
  # seta as letras disponíveis, removendo todas que já foram usadas
  def current_letters()
    letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    used_letters = @round.right_letters + @round.wrong_letters
    used_letters.split("").each do |l|
      letters.delete(l)
    end

    letters
  end

  # checa as letras corretas e as posiciona na palavra impressa usando place_letter()
  def guessed_word()
    guessed_word = ''
    @correct_word.split("").each do |l|
      if @round.right_letters.include? l
        guessed_word += l
      else
        guessed_word += '_'
      end
    end

    guessed_word
  end
  
end
