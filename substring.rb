def substring (string, substrings)
    # for each substring, check that it exists somewhere in the original string, 
    # if it does add one to its counter
    formattedStringArr = string.downcase.split("")

    substrings.reduce({}){ |substringDict, substring|
        # define last index to check since there needs to be at least as many letters
        # left in the original string as in the substring
        lastIndexToCheck = (formattedStringArr.length - substring.length)
        formattedStringArr.each_with_index { |letter, index|

            # if we have a match on the first letter of the substring,
            # and there's remaining space for the entire substring in the main string
            # then we begin to check for a match
            if index <= lastIndexToCheck && substring[0] === letter
                match = true

                
                for j in 1..(substring.length - 1)
                    if substring[j] != formattedStringArr[index + j]
                        match = false
                    end
                end

                if match
                    substringDict.key?(substring) ? substringDict[substring] += 1 : substringDict[substring] = 1
                end
            end

            #TODO performance improvement: when we have a match we can skip
            #the same amount of loops as there are letters in substring.
            
        }            
        substringDict
    }

end

p substring("teste", ["es", "te"])
