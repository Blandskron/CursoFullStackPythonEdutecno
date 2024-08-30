from sqlalchemy.orm import Session
from models import Person
from schemas import PersonCreate

def get_person(db: Session, person_id: int):
    return db.query(Person).filter(Person.id == person_id).first()

def get_people(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Person).offset(skip).limit(limit).all()

def create_person(db: Session, person: PersonCreate):
    db_person = Person(name=person.name, age=person.age, email=person.email)
    db.add(db_person)
    db.commit()
    db.refresh(db_person)
    return db_person
