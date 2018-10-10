class Notes
    def initialize
        @notes_data = []
    end
    
    def interactive_menu
        loop do 
            options_menu
            process(STDIN.gets.chomp)
        end
    end
    def options_menu
        puts "PRESS 1-to view the titles of each note"
        puts "PRESS 2-to view the body of a note"
        puts "PRESS 3-to add a new titles note"
        puts "PRESS 4-to add the body of a note"
        puts "PRESS 5-to remove a note from the file"
        puts "PRESS 6-to save the file to notes.csv"
        puts "PRESS 7-load the list from notes.csv"
        puts "PRESS 8-Exit"
    end

    def process(selection)
        case selection
            when "1"
                view_titles
            when "2"
                view_body
            when "3"
                add_title
            when "4"
                add_body
            when "5"
                delete_note
            when "6"
                save_notes
            when "7"
                load_notes
            when "8"
                exit
            else
                puts "i dont understand please try using a registered command"
        end
    end
    def add_title
        puts 'please input title'
        new_title = gets.chomp
        @notes_data << { :title => new_title, :body => nil }
        print @notes_data
    end
    

    def view_titles
        @notes_data.each_with_index do |note, index|
            puts "#{index = 1}. #{note[:title]}"
        end
    end
     
	def add_body 
		view_titles 
		puts 'which title would you like to add a body to?' 
		index = gets.chomp.to_i 
		puts "type the text you want to add" 
		@notes_data[index - 1] 
		text = gets.chomp 
		@notes_data[index - 1].replace({ :title => @notes_data[index - 1][:title], :body => text }) 
	end 
    def view_body
        puts "which note do you want to view"
        index = gets.chomp.to_i
        puts @notes_data[index - 1][:body]
    end
    def delete_note 
		puts 'which note would you like to delete?' 
		index = gets.chomp.to_i 
		@list.slice!(index - 1) 
		@list
    end
def save_notes 
    # open the file for writing 
    file = File.open("notes.csv", "w") 
    @notes_data.each do |note| 
      note_data = [note[:title], note[:body]] 
      csv_line = note_data.join(",") 
      file.puts csv_line 
    end 
end
  

  def load_notes 
    file = File.open("notes.csv", "r") 
    file.readlines.each do |note| 
      title, body = note.chomp.split(',') 
      @notes_data << { :title => title, :body => body } 
    end 
    file.close 
  end
end
