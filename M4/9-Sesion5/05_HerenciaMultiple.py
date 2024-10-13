class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
        print(f'Persona: {self.name}, Edad: {self.age}')

class Employee:
    def __init__(self, job_title, *args):
        self.job_title = job_title
        print(f'Empleado: {self.job_title}')

class Manager(Person, Employee):
    def __init__(self, name, age, job_title):
        Person.__init__(self, name, age)
        Employee.__init__(self, job_title)

# Crear instancia de Manager
manager = Manager("Ana", 30, "Gerente")
