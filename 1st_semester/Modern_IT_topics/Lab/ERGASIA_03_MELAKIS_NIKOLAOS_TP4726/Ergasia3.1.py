def Calculate(x,y):
    if choice=='+':
        return x + y
    elif choice=='-':
        return x - y
    elif choice=='x':
        return x * y
    elif choice=='/':
        return x / y
    else:
        return None


print("Επέλεξε τη πράξη που θέλεις να εκτελέσεις(enter για έξοδο).")
print("Για πρόσθεση πάτησε το '+'")
print("Για αφαίρεση πάτησε το '-'")
print("Για πολλαπλασιαμό πάτησε το 'x'")
print("Για διαίρεση πάτησε το '/'")

while True:
    
    choice = input("Δήλωσε την επιλογή σου: ")

    if choice == '':
            print("Τέλος προγράμματος!")
            break
    else:
        if choice in ('+', '-', 'x', '/'):
            num1 = float(input("Δήλωσε το πρώτο αριθμό: "))
            num2 = float(input("Δήλωσε το δεύτερο αριθμό: "))
        
        
            if choice == '+':
                print(num1, "+", num2, "=", Calculate(num1, num2))

            elif choice == '-':
                print(num1, "-", num2, "=", Calculate(num1, num2))

            elif choice == 'x':
                print(num1, "*", num2, "=", Calculate(num1, num2))

            elif choice == '/':
                print(num1, "/", num2, "=", Calculate(num1, num2))

            
        else:
            print("Λάθος επιλογή! Προσπάθησε ξανά")
