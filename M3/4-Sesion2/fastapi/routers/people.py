from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List

from crud import get_person, get_people, create_person
from schemas import Person, PersonCreate
from database import get_db

router = APIRouter()

@router.post("/people/", response_model=Person)
def create_person_endpoint(person: PersonCreate, db: Session = Depends(get_db)):
    return create_person(db=db, person=person)

@router.get("/people/", response_model=List[Person])
def read_people(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return get_people(db=db, skip=skip, limit=limit)

@router.get("/people/{person_id}", response_model=Person)
def read_person(person_id: int, db: Session = Depends(get_db)):
    db_person = get_person(db=db, person_id=person_id)
    if db_person is None:
        raise HTTPException(status_code=404, detail="Person not found")
    return db_person
