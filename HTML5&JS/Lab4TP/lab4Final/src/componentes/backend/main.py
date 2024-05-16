from fastapi import FastAPI, HTTPException, Depends
from sqlalchemy import create_engine, Column, Integer, String, Text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from fastapi.middleware.cors import CORSMiddleware


#Base = declarative_base()
from database import Base
class Laptop(Base):
    __tablename__ = "laptops"
    id = Column(Integer, primary_key=True, index=True)
    marca = Column(String, index=True)
    modelo = Column(String, index=True)
    ram_gb = Column(Integer)
    disco_tipo = Column(String)
    disco_tamano = Column(String)
    disco_marca = Column(String)
    placa_video = Column(Text)
    precio = Column(Integer)

DATABASE_URL = "postgresql://geron:gero1997@localhost/laptops_inventory"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

app = FastAPI()

# Configuración para permitir CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/laptops/", response_model=Laptop)
def create_laptop(laptop: Laptop, db: Session = Depends(get_db)):
    db.add(laptop)
    db.commit()
    db.refresh(laptop)
    return laptop

@app.get("/laptops/", response_model=list[Laptop])
def read_laptops(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    laptops = db.query(Laptop).offset(skip).limit(limit).all()
    return laptops

@app.get("/laptops/{laptop_id}", response_model=Laptop)
def read_laptop(laptop_id: int, db: Session = Depends(get_db)):
    laptop = db.query(Laptop).filter(Laptop.id == laptop_id).first()
    if laptop is None:
        raise HTTPException(status_code=404, detail="Laptop not found")
    return laptop

@app.put("/laptops/{laptop_id}", response_model=Laptop)
def update_laptop(laptop_id: int, laptop: Laptop, db: Session = Depends(get_db)):
    db_laptop = db.query(Laptop).filter(Laptop.id == laptop_id).first()
    if db_laptop is None:
        raise HTTPException(status_code=404, detail="Laptop not found")
    for key, value in laptop.dict().items():
        setattr(db_laptop, key, value)
    db.commit()
    db.refresh(db_laptop)
    return db_laptop

@app.delete("/laptops/{laptop_id}", response_model=Laptop)
def delete_laptop(laptop_id: int, db: Session = Depends(get_db)):
    laptop = db.query(Laptop).filter(Laptop.id == laptop_id).first()
    if laptop is None:
        raise HTTPException(status_code=404, detail="Laptop not found")
    db.delete(laptop)
    db.commit()
    return laptop
