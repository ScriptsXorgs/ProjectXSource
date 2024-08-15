from cryptography.fernet import Fernet

def encrypt_file(file_path, key):
    with open(file_path, 'rb') as file:
        file_data = file.read()

    cipher_suite = Fernet(key)
    encrypted_data = cipher_suite.encrypt(file_data)

    with open(file_path, 'wb') as file:
        file.write(encrypted_data)

# Generar una clave de cifrado
key = Fernet.generate_key()

# Ruta al archivo que se desea encriptar
file_path = 'PASSWD.sql'

# Encriptar el archivo
encrypt_file(file_path, key)