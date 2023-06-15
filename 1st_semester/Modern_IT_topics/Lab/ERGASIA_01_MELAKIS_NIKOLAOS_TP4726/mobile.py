stath=float(input("Δώσε το ύψος του μηνιαίου λογαριασμού σου (προ ΦΠΑ)"))

if(stath<=50):
    kin=stath*0.12
    print(f"Τέλος συνδρομητικών τηλεφωνίας: {kin:.2f}ευρώ")
elif (stath>50 and stath<=100):
    x=stath-50
    y=stath-x
    kin=(y*0.12)+(x*0.15)
    print(f"Τέλος συνδρομητικών τηλεφωνίας: {kin:.2f}ευρώ")
elif (stath>100 and stath<=150):
    x=stath-100
    y=stath-x-50
    
    
    kin=(x*0.18)+(y*0.15)+(y*0.12)
    print(f"Τέλος συνδρομητικών τηλεφωνίας: {kin:.2f}ευρώ")
    
else:
    kin=stath*0.2

tel=stath+kin
print("Συνολική χρέωση προ ΦΠΑ:",tel,"ευρώ") 
print(f"ΦΠΑ 24%: {tel*0.24:.2f}ευρώ")
tel=tel+tel*0.24
print(f"Συνολικό ποσό πληρωμής: {tel:.2f}ευρώ")
    


