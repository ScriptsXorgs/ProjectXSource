import random

bajos = "qszawxedcrgvftbyhnukmjioplñ"
altos = "QSZAWXEDCRGVFTBYHNUKMJIOPLÑ"
numeros = "4231867509"
symbols = "!@#$%¬°*( )_-+=?><[]"

all_chars = altos + numeros + bajos + symbols

length = int(input("Enter LEGTH> "))

passwd = ''.join(random.sample(all_chars, length))
print("Passwd GENERATED> ", passwd)