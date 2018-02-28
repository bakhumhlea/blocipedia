module RandomData
    
    def self.random_paragraph
        sentences = []
        rand(4..6).times do
            sentences << random_sentence
        end
        
        sentences.join(" ")
    end
 
    def self.random_sentence
        strings = []
        rand(3..8).times do
            strings << random_word
        end
    
        sentence = strings.join(" ")
        sentence.capitalize << "."
    end
 
    def self.random_word
        letters = ('a'..'z').to_a
        letters.shuffle!
        letters[0,rand(3..8)].join
    end
    
    def self.random_name
        names = ['Kakashi','Luffy','Sanji','Jousuke','Joruno','Sasuke','Bejita','Joutaro','Jinbei','Bujarati','Yoshikage']
        names.sample
    end
    
    def self.random_number
        num = (0..9).to_a
        num.shuffle!
        result = num[0,ran(2..5)].join
        if result[0] == '0'
            result.shift
            result
        else
            result
        end
    end
end