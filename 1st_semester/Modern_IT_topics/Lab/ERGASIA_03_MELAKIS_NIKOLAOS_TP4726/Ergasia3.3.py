from tkinter import *
import math

def add_function():
    e3.delete(0,10)
    e3.insert(0, str(int(e1.get())+int(e2.get())))
    
def sub_function():
    e3.delete(0,10)
    e3.insert(0, str(int(e1.get())-int(e2.get())))
    
def mult_function():
    e3.delete(0,10)
    e3.insert(0, str(int(e1.get())*int(e2.get())))
    
def div_function():
    e3.delete(0,10)
    try:
        e3.insert(0, str(int(e1.get())/int(e2.get())))
        lbError.set("")
    except ZeroDivisionError:
        e3.insert(0,"ERROR")
        lbError.set("Δεν γίνεται διαίρεση με το μηδέν")
        return
    
def pow_function():
    e3.delete(0,10)
    e3.insert(0, pow(int(e1.get()),int(e2.get())))
    
def log_function():
    e3.delete(0,10)
    lbError.set("")
    try:
        e3.insert(0, (math.log(int(e1.get()),int(e2.get()))))
    except ValueError:
        lbError.set("Οι αριθμοί πρέπει να είναι θετικοί")
        
def pow2_function():
    e3.delete(0,10)
    e3.insert(0, pow(int(e1.get()),2))
    
def log10_function():
    e3.delete(0,10)
    e3.insert(0, (math.log(int(e1.get()),10)))
    

def clear_entries():
    e1.delete(0,10)
    e2.delete(0,10)
    e3.delete(0,10)

root=Tk()

l1=Label(root, text='1ος αριθμός:')
l1.grid(row=0, sticky=W)
e1=Entry(root)
e1.grid(row=0, column=1)

l2=Label(root, text='2ος αριθμός')
l2.grid(row=1, sticky=W)
e2=Entry(root)
e2.grid(row=1, column=1)

l3=Label(root, text='Αποτέλεσμα')
l3.grid(row=2, sticky=W)
e3=Entry(root)
e3.grid(row=2, column=1)

lbError=StringVar()
l4=Label(root, textvariable=lbError)
l4.grid(row=12)

b2=Button(root, text='Πρόσθεση', fg='navy', command=add_function)
b2.grid(row=3, sticky=W)


b3=Button(root, text='Αφαίρεση', fg='navy', command=sub_function)
b3.grid(row=4, sticky=W)


b4=Button(root, text='Πολαπλασιασμό', fg='navy', command=mult_function)
b4.grid(row=5, sticky=W)


b5=Button(root, text='Διαίρεση', fg='navy', command=div_function)
b5.grid(row=6, sticky=W)


b6=Button(root, text='Δύναμη', fg='navy', command=pow_function)
b6.grid(row=7, sticky=W)


b7=Button(root, text='Λογάριθμος', fg='navy', command=log_function)
b7.grid(row=8, sticky=W)


b8=Button(root, text='Τετράγωνο 1ου αριθμού', fg='navy', command=pow2_function)
b8.grid(row=9, sticky=W)


b9=Button(root, text='log10(1ου αριθμού)', fg='navy', command=log10_function)
b9.grid(row=10, sticky=W)



b10=Button(root, text='Καθαρισμός', fg='red', command=clear_entries)
b10.grid(row=11, sticky=W)

root.mainloop()
