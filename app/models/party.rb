# frozen_string_literal: true

class Party < ApplicationRecord
  belongs_to :game
  has_many :solutions

  def ten_letters_list
    vowels = %w[a e i o u]
    consonants = %w[b c d f g h j k l m n p q r s t v w x y z]
    ten_letters = []
    5.times do
      ten_letters << vowels.sample
    end
    5.times do
      ten_letters << consonants.sample
    end
    ten_letters.shuffle.join.to_s
  end

  def self.verif_word(ten_letters_list, word)
    check_word = Hash.new(0)
    ten_letters_list.each_char { |letter| check_word[letter.downcase] += 1 }
    word.each_char { |letter| check_word[letter.downcase] -= 1 }
    check_word.values.all? { |value| value >= 0 }
  end

  def score
    return 0 if word.nil? || word.blank?
    word.length
  end
end
