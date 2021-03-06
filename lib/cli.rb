# frozen_string_literal: true

class CLI
  attr_accessor :chosen_list, :input
  def call
    introduction
    @input = gets.chomp.downcase
    letter_block
  end

  def letter_block
    while input != "exit"
      if letter_valid?(input)
        @chosen_list = Game.get_first_letter(input)

        chosen_list.each_with_index do |name, i|
          puts "#{i + 1}. #{name}"
        end
        number_block
      else
        @input = gets.chomp.downcase
        letter_block
      end
    end
  end

  def number_block
    puts "Select a game by entering its corresponding number"
    @input = gets.chomp
    return if @input == "exit"

    if number_valid?(input)
      game = Game.create(input, chosen_list)
      puts "Rank: #{game.rating}, #{game.developer}" # final output
      sleep(3)
      call # restarts application
    else
      number_block
    end
  end

  def letter_valid?(letter)
    if /\A\s*\Z/.match?(letter)
      puts "No blanks! Please input a single letter:"
      false
    elsif letter.length > 1
      puts "Too many characters or invalid format! Please input a single letter:"
      false
    elsif !/[a-z]/.match?(letter)
      puts "Please select a letter in English from A-Z:"
      false
    elsif Game.get_first_letter(letter).empty?
      puts "Title does not exist. Please select another letter:"
      false
    else
      true
    end
  end

  def number_valid?(number)
    number.to_i.positive? && number.to_i <= chosen_list.length
  end

  def introduction
    puts "Welcome to my IGN Bottom 100 Video Games application!"
    puts "IGN is an American video game and entertainment media website"
    puts "that has compiled a list of their top video games of all time"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "The purpose of this application is to display"
    puts "the ranking and developer of a video game you select from games ranked 100-51"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Type 'exit' at any input points to leave the application"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Enter a letter to generate a list of video games that begin with that letter:"
  end
end
