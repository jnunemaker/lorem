module Lorem
  class UnsupportedType < StandardError; end
  class MustBePositive < StandardError; end
  
  class Base
    attr_accessor :type, :number
    PARAGRAPHS = [
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vivamus vitae risus vitae lorem iaculis placerat. Aliquam sit amet felis. Etiam congue. Donec risus risus, pretium ac, tincidunt eu, tempor eu, quam. Morbi blandit mollis magna. Suspendisse eu tortor. Donec vitae felis nec ligula blandit rhoncus. Ut a pede ac neque mattis facilisis. Nulla nunc ipsum, sodales vitae, hendrerit non, imperdiet ac, ante. Morbi sit amet mi. Ut magna. Curabitur id est. Nulla velit. Sed consectetuer sodales justo. Aliquam dictum gravida libero. Sed eu turpis. Nunc id lorem. Aenean consequat tempor mi. Phasellus in neque. Nunc fermentum convallis ligula.",
      "Suspendisse in nulla. Nunc eu ipsum tincidunt risus pellentesque fringilla. Integer iaculis pharetra eros. Nam ut sapien quis arcu ullamcorper cursus. Vestibulum tempor nisi rhoncus eros. Sed iaculis ultricies tellus. Cras pellentesque erat eu urna. Cras malesuada. Quisque congue ultricies neque. Nullam a nisl. Sed convallis turpis a ante. Morbi eu justo sed tortor euismod porttitor. Aenean ut lacus. Maecenas nibh eros, dapibus at, pellentesque in, auctor a, enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam congue pede a ipsum. Sed libero quam, sodales eget, venenatis non, cursus vel, velit. In vulputate.",
      "In vehicula. Aenean quam mauris, vehicula non, suscipit at, venenatis sed, arcu. Etiam ornare fermentum felis. Donec ligula metus, placerat quis, blandit at, congue molestie, ante. Donec viverra nibh et dolor. Sed elementum, nunc ac gravida pulvinar, libero ligula vestibulum urna, eget luctus eros ipsum ut velit. Vestibulum at diam. Suspendisse hendrerit. Sed facilisis libero pretium nisl. Morbi eget urna ut mi egestas aliquet. Donec interdum, urna eget semper ultrices, nibh sapien laoreet massa, at laoreet nulla metus sit amet nunc. In augue. Etiam sit amet sapien. Aliquam nulla mi, tincidunt a, ullamcorper pharetra, mollis eu, purus.",
      "Suspendisse auctor nunc a dolor. Donec elit diam, fringilla nec, cursus a, dapibus ut, justo. Maecenas rhoncus lacinia mi. Sed tempus leo in risus. Quisque vitae est. Integer eu mi vel justo lacinia posuere. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec pretium auctor mauris. Cras at risus. Vestibulum ligula purus, venenatis varius, tincidunt aliquam, volutpat ut, felis. In nulla. Suspendisse magna. Fusce ac tortor. Morbi semper hendrerit purus. Donec scelerisque erat quis magna. Vivamus interdum metus at tellus.",
      "Nam molestie suscipit arcu. Sed sed leo non sapien lobortis gravida. Mauris ultricies imperdiet lacus. Maecenas semper sapien in mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc euismod odio eget lectus. Vestibulum nonummy pharetra eros. Donec semper venenatis sapien. Phasellus scelerisque lectus quis tortor. Quisque turpis. Etiam rutrum metus eget nisi. Morbi varius ligula id elit. Ut augue.",
      "Nulla arcu est, rhoncus non, eleifend ut, imperdiet vel, magna. Sed pretium pulvinar augue. Sed sit amet nulla eget lacus viverra sollicitudin. Nulla facilisi. Proin sed ipsum vel lacus faucibus dignissim. Nulla purus. Nullam sapien elit, elementum eget, consequat vitae, vehicula cursus, pede. Sed quis leo. Praesent tincidunt convallis ligula. Sed purus eros, malesuada eget, posuere a, convallis suscipit, tellus. Proin tincidunt. Suspendisse leo. Suspendisse risus nisi, hendrerit in, ullamcorper id, porta in, pede. Maecenas lectus mi, congue vitae, ullamcorper vitae, bibendum sit amet, dui. Ut volutpat, nibh scelerisque malesuada bibendum, ipsum felis elementum lacus, nec pretium libero neque ut elit. Duis enim. Fusce arcu nulla, sodales eget, rhoncus sed, fermentum a, erat. Donec vitae mi.",
      "Duis sed nunc a justo egestas tincidunt. Morbi elit. Morbi venenatis fermentum erat. Cras purus orci, imperdiet a, sodales vel, aliquet at, quam. Etiam erat diam, ornare a, nonummy ut, accumsan non, felis. Fusce dignissim. Ut in ligula vitae risus varius viverra. Aenean elit diam, dapibus et, imperdiet in, suscipit at, felis. Curabitur vitae nunc ac mauris tincidunt posuere. Morbi id tortor. Nam sagittis. Sed dolor. Nulla imperdiet magna et lectus. Vivamus sapien diam, condimentum at, ultricies nec, vestibulum sit amet, pede. Nunc non orci vel magna lacinia sodales. In ac nunc vel mauris pharetra pharetra.",
      "Integer quis orci. Nam ultrices, magna nec ullamcorper tincidunt, enim massa semper arcu, sit amet malesuada velit nibh a enim. Phasellus molestie neque eget lorem semper convallis. Duis eget leo. Maecenas commodo vehicula nisi. In viverra massa sed justo. Vestibulum quis velit. Nunc id nulla. Ut eget sem. Nullam congue placerat ante. Mauris ut leo. Cras semper dolor at odio. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
      "Vivamus quis velit. Aliquam erat volutpat. Praesent malesuada tincidunt purus. Vestibulum quis pede. Praesent luctus, nunc in eleifend fermentum, risus lacus tristique mi, ac mollis metus mi at lectus. Proin tortor. Phasellus erat. Duis cursus nunc non metus. Vivamus hendrerit neque eu felis. Sed interdum metus a enim. Aliquam aliquet vehicula erat. Vivamus tortor neque, ornare ac, cursus id, nonummy ultricies, turpis. Proin tempor nonummy tellus. Praesent metus neque, accumsan eu, tempor sed, porta facilisis, pede. Cras nec nisl in turpis porta congue.",
      "Maecenas sollicitudin feugiat urna. Maecenas tellus. Vestibulum semper, lacus in blandit blandit, neque lectus ullamcorper nulla, at viverra elit justo ac lacus. Proin gravida enim non neque ultricies dictum. In vulputate mattis lacus. In mollis nibh a lacus. Aenean a ipsum. Vivamus egestas adipiscing eros. Cras gravida suscipit risus. Maecenas varius sagittis velit. Phasellus rhoncus risus. Nunc quis urna at neque convallis hendrerit. Mauris metus. Integer eleifend eros nec nunc venenatis ultrices. Curabitur placerat. Nam eros dui, semper vitae, tincidunt quis, tincidunt eu, risus. Ut in pede a neque condimentum feugiat. Maecenas dictum tortor non neque.",
      "Cras pulvinar rhoncus quam. Nam euismod massa sed urna. Suspendisse molestie gravida nulla. Sed imperdiet, nulla quis blandit accumsan, libero velit lobortis felis, sit amet consectetuer elit tellus vitae urna. Nunc rhoncus euismod urna. Donec a pede. Morbi viverra. Vivamus faucibus ipsum sit amet velit. Aenean est urna, posuere cursus, fringilla et, vestibulum eget, erat. Quisque accumsan turpis congue ipsum. Nam lectus purus, blandit eu, hendrerit sed, varius nec, lectus. Quisque bibendum sodales purus. Nulla at nulla eget arcu imperdiet aliquam. Nullam vitae quam. Nam at lorem.",
      "Nulla tempus. Nullam non lorem. Sed non arcu. Pellentesque sit amet arcu. Praesent eu ligula. Donec sagittis, lacus ac laoreet commodo, nisl risus cursus libero, ac aliquam ipsum erat sed ante. Etiam consequat, sapien vel dapibus lobortis, orci turpis sollicitudin quam, ac porttitor magna diam nec massa. Aenean aliquam, nisl eu imperdiet gravida, eros nisi facilisis velit, eget interdum libero sem ut eros. Sed magna. Sed vitae odio. Praesent augue. Proin volutpat. Maecenas urna quam, accumsan sit amet, sodales vitae, commodo sed, purus. Donec hendrerit. Suspendisse congue. Fusce diam metus, laoreet in, mattis ut, ullamcorper ac, urna. In eget lacus. Sed mollis iaculis pede."
    ]
    
    TYPES = [:paragraphs, :words, :chars, :characters]
    
    class << self
      # Gets the total number of paragraphs I included in the gem.
      def total_included_paragraphs
        PARAGRAPHS.size
      end
      
      # Gets the total number of words in the included paragraphs.
      def total_included_words
        included_paragraphs_joined.split(' ').size
      end
      
      # Gets the total number of characters in the included paragraphs.
      def total_included_characters
        included_paragraphs_joined.split(/./).size
      end
      
      # Returns a string of the included paragraphs joined by two \n's
      def included_paragraphs_joined
        PARAGRAPHS.join("\n\n")
      end
    end
    
    # <tt>type</tt> - the type of output (either paragraphs, words, or characters)
    # <tt>number</tt> - the number of types to output
    def initialize(type, number)
      type = type.to_s.downcase.intern
      number = number.to_i
      raise UnsupportedType unless TYPES.include?(type)
      raise MustBePositive if number < 1
      @type, @number = type, number.to_i
    end
    
    # Outputs the lorem text based on the type and number
    def output
      send("output_#{@type}")
    end
    
    private
      # Outputs the correct number of paragraphs based on the number
      def output_paragraphs
        if @number <= self.class.total_included_paragraphs
          PARAGRAPHS[0, @number].join("\n\n")
        else
          repeat = (@number / self.class.total_included_paragraphs.to_f).ceil
          (PARAGRAPHS * repeat)[0, @number].join("\n\n")
        end
      end
      
      # Outputs the correct number of words based on the number
      def output_words
        if @number <= self.class.total_included_words
          convert_paragraphs_to_words(self.class.included_paragraphs_joined)
        else
          repeat = (@number / self.class.total_included_words.to_f).ceil
          convert_paragraphs_to_words((PARAGRAPHS * repeat).join("\n\n"))
        end
      end
      
      # Outputs the correct number of characters based on the number
      def output_characters
        if @number <= self.class.total_included_characters
          convert_paragraphs_to_characters(self.class.included_paragraphs_joined)
        else
          repeat = (@number / self.class.total_included_words.to_f).ceil
          convert_paragraphs_to_characters((PARAGRAPHS * repeat).join("\n\n"))
        end
      end
      alias :output_chars :output_characters
      
      # Converts paragraphs to the correct number of basic words by splitting on a space
      def convert_paragraphs_to_words(str)
        str.split(' ')[0, @number].join(' ')
      end
      
      # Converts paragarphs to the correct number of characters
      def convert_paragraphs_to_characters(str)
        str[0, @number]
      end
  end
end