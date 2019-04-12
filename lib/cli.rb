# handles what the user sees. SO -- "puts" and gets. Then as little else as possible.
class CLI
  def call
    # Should provide output to user that makes sense without any additional explanation.
    puts "Welcome to my IGN Top 100 Video Games application!"
    puts "IGN is an American video game and entertainment media website that has compiled a list of their top 100 video games of all time"
    puts "The purpose of this application is to show you the release year and description a game you choose from IGN's list"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Type 'exit' to leave the application"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "First, enter a single letter to generate a list of IGN's top 100 video games that begin with that letter:"

    letter = gets.chomp.downcase
    while letter != "exit"
      if letter =~ /\A\s*\Z/
        puts "No blanks! Please input a single letter:"
        letter = gets.chomp.downcase
      elsif letter.length > 1
        puts "Too many characters or invalid format! Please input a single letter:"
        letter = gets.chomp.downcase
      elsif !(letter =~ /[a-z]/)
        puts "Please select a letter in english from A-Z:"
        letter = gets.chomp.downcase
      else
        chosen_list = Game.get_first_letter(letter) #display generated list of amiibos starting with user input 'letter'
        chosen_list.each_with_index do |name, i|
          puts "#{i + 1}. #{name}"
        end
        puts "Select a game by entering its corresponding number"
        number = gets.chomp.to_i
        Game.create(number, chosen_list)
      end

      puts "Select a game by entering its corresponding number"

      number = gets.chomp.to_i
    end
  end
  #Scrape and save all amiibos
end
