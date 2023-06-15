from tkinter import *
import math

#Addition function
#In case of a or b being empty,they are assigned as 0
def add_function():
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')
    try:
        e3.insert(0,str(int(e1.get()) + int(e2.get())))
    except ValueError:
        if e1.get():
            e3.insert(0,str(int(e1.get())+0))
        elif e2.get():
            e3.insert(0, str(int(e2.get()) + 0))
        else:
            e3.insert(0,str(0))

#Subtract function
#In case of a or b being empty,they are assigned as 0
def sub_function():
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')
    try:
        e3.insert(0,str(int(e1.get())-int(e2.get())))
    except ValueError:
        if e1.get():
            e3.insert(0,str(int(e1.get())))
        elif e2.get():
            e3.insert(0, str(int(e2.get())))
        else:
            e3.insert(0,str(0))

#Multiply function
#In case of a or b being empty,they are assigned as 0
def mul_function():
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')
    try:
        e3.insert(0,str(int(e1.get())*int(e2.get())))
    except ValueError:
        e3.insert(0,str(0))

#Division function
#In case of divisor b being empty,message is shown
#In case of divisor b being 0 ,division error message is shown
def div_function():
    e3.delete(0, 10)
    try:
        e3.insert(0, str(float(e1.get()) / float(e2.get())))
        lblErrorMessage.set('Error Message: -')
    except ValueError:
        if(not e1.get()):
            lblErrorMessage.set('Error Message: -')
            e3.insert(0, str(0 / float(e2.get())))
        else:
            e3.insert(0, 'Error')
            lblErrorMessage.set('Ο διαιρέτης δεν μπορεί να είναι κενός')
        return
    except ZeroDivisionError:
        e3.insert(0, 'Error')
        lblErrorMessage.set('Δεν μπορεί να γίνει διαίρεση με το μηδέν')
        return

#Power a^b
#In case of a or b being empty,they are assigned as 0
def power_function():
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')
    try:
        e3.insert(0, str(pow(float(e1.get()),float(e2.get()))))
    except ValueError:
        if not e1.get():
            e3.insert(0, str(0))
        elif not e2.get():
            e3.insert(0, str(pow(float(e1.get()), 0)))

#Square (a)
#In case of a being empty,a is assigned as 0
#In case of  a being negative, message is shown
def sqrt_function():
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')
    try:
        e3.insert(0,str(math.sqrt(int(e1.get()))))
    except ValueError:
        if not e1.get():
            e3.insert(0, str(math.sqrt(0)))
        else:
            e3.delete(0, 10)
            e3.insert(0, 'Error')
            lblErrorMessage.set('Δεν μπορεί να υπολογιστεί αρνητική ρίζα')

#Logarithm (a) with base b
#In case of a or b being empty,error message is shown
#In case of a or b being negative , error message is shown
def log_generic_function():
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')
    try:
        e3.insert(0,str(math.log(float(e1.get()),float(e2.get()))))
    except ValueError:
        if not e1.get() or not e2.get():
            e3.insert(0, 'Error')
            lblErrorMessage.set('Τα α,β δεν μπορεί να είναι κενά')
        else:
            e3.insert(0, 'Error')
            lblErrorMessage.set('Ο λογάριθμός πρέπει να έχει θετικά α,β')

#Logarithm (a) with base 10
#In case of a or b being empty or negative,error message is shown
def log_decimal_function():
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')
    try:
        e3.insert(0,str(math.log(float(e1.get()))))
    except ValueError:
        e3.insert(0, 'Error')
        lblErrorMessage.set('Ο λογάριθμός πρέπει να έχει θετικό α')

#clear all fields
def clear_entries():
    e1.delete(0,10)
    e2.delete(0, 10)
    e3.delete(0, 10)
    lblErrorMessage.set('Error Message: -')


root = Tk()

#construction of all visual components
l1 = Label(root, text ='Αιθμός (α):')
l1.grid(row=0, sticky =W)

e1 = Entry(root)
e1.grid(row=0, column=1)

l2 = Label(root, text ='Αριθμός (β):')
l2.grid(row=1, sticky =W)

e2 = Entry(root)
e2.grid(row=1, column=1)

l3 = Label(root, text ='Αποτέλεσμα:')
l3.grid(row=2, sticky =W)

lblErrorMessage = StringVar()
lblErrorMessage.set('Error Message: -')

l4 = Label(root, textvariable = lblErrorMessage)
l4.grid(row=6)

e3 = Entry(root)
e3.grid(row=2, column=1)

b1 = Button(root,text='Πρόσθεση',fg='navy',command=add_function)
b1.grid(row=3,column = 0)

b2 = Button(root,text='Αφαίρεση',fg='navy',command=sub_function)
b2.grid(row=3,column = 1)

b3 = Button(root,text='Πολλαπλασιασμός',fg='navy',command=mul_function)
b3.grid(row=3,column = 2)

b4 = Button(root,text='Διαίρεση',fg='navy',command=div_function)
b4.grid(row=4,column = 0)

b5 = Button(root,text='Τετρ. Ρίζα (α)',fg='navy',command=sqrt_function)
b5.grid(row=4,column = 1)

b6 = Button(root,text='Δύναμη α^β',fg='navy',command=power_function)
b6.grid(row=4,column = 2)

b7 = Button(root,text='Logβ(α)',fg='navy',command=log_generic_function)
b7.grid(row=5,column = 0)

b8 = Button(root,text='Log(α)',fg='navy',command=log_decimal_function)
b8.grid(row=5,column = 1)

b9 = Button(root,text='Καθαρισμός',fg='navy',command=clear_entries)
b9.grid(row=5,column = 2)

root.mainloop()