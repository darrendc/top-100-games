# frozen_string_literal: true

class CLI
  def call
    introduction
    # Should provide output to user that makes sense without any additional explanation.
    letter = gets.chomp.downcase
    while letter != "exit"
      if letter =~ /\A\s*\Z/
        puts "No blanks! Please input a single letter:"
        letter = gets.chomp.downcase
      elsif letter.length > 1
        puts "Too many characters or invalid format! Please input a single letter:"
        letter = gets.chomp.downcase
      elsif letter !~ /[a-z]/
        puts "Please select a letter in English from A-Z:"
        letter = gets.chomp.downcase
      else
        chosen_list = Game.get_first_letter(letter)
        chosen_list.each_with_index do |name, i|
          puts "#{i + 1}. #{name}"
        end

        puts "Select a game by entering its corresponding number"

        number = gets.chomp.to_i
        game = Game.create(number, chosen_list) # instead of passing
        puts "Rating: #{game.rating}, #{game.developer}"
      end
    end
  end

  def introduction
    puts "Welcome to my IGN Top 100 Video Games application!"
    puts "IGN is an American video game and entertainment media website"
    puts "that has compiled a list of their top 100 video games of all time"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "The purpose of this application is to display"
    puts "the ranking and developer of a game you choose from IGN's list"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Type 'exit' to leave the application at any time"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Enter a letter to generate a list of video games that begin with that letter:"
  end
end
