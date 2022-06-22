

#!/bin/bash


filename='source.txt'
while read line
do
        count=`echo $line | wc -w`       #count the number of column in each line
         if [[ $count -eq 3 ]]           #check there is 3 column:name,email and id
         then
                id=`echo $line | cut -d " " -f 3`        #get the id column
                email=`echo $line | cut -d " " -f 2`     #get the email column
                b=2
                res=$((id%b))                            #calculate the modulus of id
                if [[ $res == "0" ]]              #check for the id even or odd 
                then
                        if [[ $email == \@.* ]]            #check for the right pattern of the email
                        then
                                echo $id "of" $email "is even number"
                         fi
                else
                        if [[ $email == \@.* ]]
                        then
                                echo $id "of" $email "is odd number"
                        fi
                fi

         fi
done < $filename                      #pass the source file that contain the values
