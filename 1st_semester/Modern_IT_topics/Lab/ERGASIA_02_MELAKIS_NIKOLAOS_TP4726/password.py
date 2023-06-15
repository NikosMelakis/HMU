import re

def is_valid_password(pwd):                 
    counter_rules_prerequisites = 0         
    errors_messages = []                   
    special_chars = ['!', '@', '#', '$', '&', '_']
    password_strength = 0
    rules = [lambda s: any(x.isupper() for x in pwd),  
            lambda s: any(x.islower() for x in pwd),  
            lambda s: any(x.isdigit() for x in pwd), 
            lambda s: len(pwd) > 7,  
            lambda s: any(x in special_chars for x in pwd)  
            ]

    try:
        pwd.encode(encoding='utf-8').decode('ascii') 
        if not re.match('^[a-zA-Z0-9!@#$&_]*$', pwd):  
            errors_messages.append('Το συνθηματικό σου περιέχει μη επιτρεπτούς ειδικούς χαρακτήρες.Μόνο "!", "@", "#", "$", "&", "_" επιτρέπονται.')
            print(" ".join(errors_messages), end='\n')
            return 0
    except UnicodeDecodeError:
        errors_messages.append('Το συνθηματικό σου περιέχει μη επιτρεπτούς χαρακτήρες.Μόνο Λατινικοί χαρακτήρες επιτρέπονται.')
        print(" ".join(errors_messages), end='\n')
        return 0
    if not len(pwd) > 7:   #case length is below 8
        errors_messages.append('Το συνθηματικό σου πρέπει να έχει μήκος τουλάχιστον 8 χαρακτήρες.')
        print(" ".join(errors_messages), end='\n')
        return 0
    if any(x.isupper() for x in pwd):
        counter_rules_prerequisites = counter_rules_prerequisites + 1
    if any(x.islower() for x in pwd):
        counter_rules_prerequisites = counter_rules_prerequisites + 1
    if any(x.isdigit() for x in pwd):
        counter_rules_prerequisites = counter_rules_prerequisites + 1
    if any(x in special_chars for x in pwd):
        counter_rules_prerequisites = counter_rules_prerequisites + 1
    if counter_rules_prerequisites >= 3:   
        if len(pwd) == 8:                   
            password_strength = 1
        else:                               
            password_strength = 1
            password_length = len(pwd)
            for j in range (9, password_length, 3):
                password_strength = password_strength + 1
        if all(rule(pwd) for rule in rules):            
            password_strength = 2 * password_strength
            return password_strength
        else:
            return password_strength
    if counter_rules_prerequisites < 3:  
        print("Το συνθηματικό σου δεν περιέχει στοιχεία από τρεις τουλάχιστον κατηγορίες", end='\n')
        if not any(x.isupper() for x in pwd):
            errors_messages.append('Ο κωδικός που έβαλες δεν περιέχει 1 τουλάχιστον κεφαλαίο.')
        if not any(x.islower() for x in pwd):
            errors_messages.append('Ο κωδικός που έβαλες δεν περιέχει 1 τουλάχιστον πεζό.')
        if not any(x.isdigit() for x in pwd):
            errors_messages.append('Ο κωδικός που έβαλες δεν περιέχει 1 τουλάχιστον αριθμητικό ψηφίο.')
        if not any(x in special_chars for x in pwd):
            errors_messages.append('Ο κωδικός που έβαλες δεν περιέχει 1 τουλάχιστον ειδικό χαρακτήρα "!", "@", "#", "$", "&", "_"')
        for error in errors_messages:
            print(error)
        return password_strength

while True:         
    inputPassword = input("Όρισε το συνθηματικό σου : ")
    password_strength = is_valid_password(inputPassword)
    if password_strength<1:
        continue
    else:
        print("Το συνθηματικό σου είναι έγκυρο και έχει ισχύ " , password_strength)
        break
