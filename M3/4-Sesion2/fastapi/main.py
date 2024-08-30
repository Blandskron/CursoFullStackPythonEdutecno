from fastapi import FastAPI
from routers import people
import models
from database import engine

# Asegúrate de que las tablas estén creadas
models.Base.metadata.create_all(bind=engine)

app = FastAPI()
app.title = "API"
app.version = "0.0.1"

app.include_router(people.router)
