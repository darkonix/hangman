class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :word

  before_create :set_word
  after_save :new_round

private
  def set_word
    self.word_id = loop do
      Word.uncached do
        self.word_id = Word.select(:id).order("RANDOM()").first.id
      end
      unless Round.find_by(game_id: self.game_id, word_id: self.word_id, win: true)
        break self.word_id
      else      
        break if Round.where(game_id: self.game_id, win: true).count >= Word.count()
      end
    end
  end

  def new_round
    if self.win_changed?
      @game = self.game
      @game.rounds.build
      @game.save
    end
  end
end
