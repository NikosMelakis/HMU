count=0

while(count==0):
    wrd=str(input("Πληκρολόγηστε μια λέξη: "))


    size=len(wrd)
    x=0
    y=0
    k=0

    for j in range (0,size-1):
        if(wrd[j]=='\n'):
            
            break
            break
            
    
        k=k+1
        for i in range (k,size):
            y=1
            if (wrd[j]==wrd[i]):
                x=x+1
            
    if(x>0):
        print("Η λέξη δεν είναι μονογραμματική!")
    elif(y==1):
        print("Η λέξη είναι μονογραμματική")
    else:
        print("Το πρόγραμμα τερματίστηκε")
        count=count+1

        


    

