while True:
    userinput_int_list = []
    userInput = input("Εισάγετε ένα barcode(exit για έξοδο): ")
    if(userInput=="exit"):
        print("Κλείσιμο προγράμματος...")
        break
    try:                                                        
        val = int(userInput)
    except ValueError:
        print("Δεν είναι αριθμός!")
    for char in userInput:
        userinput_int_list.append(char)
    if len(userinput_int_list) !=12:                            
        userinput_int_list= []
        print("Το μήκος του Barcode πρέπει να είναι 12-χαρακτήρες ακριβώς!!")
        continue
    userinput_int_list = list(map(int,userinput_int_list))
    length = len(userinput_int_list)
    s1 = 0
    s2 = 0
    s3 = 0
    d = userinput_int_list[11]      
    for i in range(0,length-1,2):
        s1 = s1 +userinput_int_list[i]
    for i in range(1,length-1,2):
        s2 = s2 + userinput_int_list[i]
    s3 = 3*s1 + s2
    if(((s3+d)%10)==0):                                                                 
        print(''.join(str(digit) for digit in userinput_int_list),": είναι σωστός")
    else:                                                                               
        print(''.join(str(digit) for digit in userinput_int_list),": δεν είναι σωστός")

