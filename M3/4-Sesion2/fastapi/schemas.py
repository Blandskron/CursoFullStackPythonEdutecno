from pydantic import BaseModel

class PersonBase(BaseModel):
    name: str
    age: int
    email: str

class PersonCreate(PersonBase):
    pass

class Person(PersonBase):
    id: int

    class Config:
        orm_mode = True
