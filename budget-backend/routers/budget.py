from typing import List
from fastapi import APIRouter, Depends, status, HTTPException
import schemas
import database
import models
import oauth2
import tokens
from sqlalchemy.orm import Session
from repository import budget

router = APIRouter(
    prefix="/Budget",
    tags=['Budgets']
)

get_db = database.get_db


@router.get('/', response_model=List[schemas.BudgetCreate])
def all(db: Session = Depends(get_db), current_user: schemas.User = Depends(oauth2.get_current_user)):
    return budget.get_all(db)


@router.post('/', status_code=status.HTTP_201_CREATED)
def create(request: schemas.BudgetCreate, db: Session = Depends(get_db), current_user: schemas.User = Depends(oauth2.get_current_user)):
    return budget.create(request, db)


@router.delete('/{id}', status_code=status.HTTP_204_NO_CONTENT)
def destroy(id: int, db: Session = Depends(get_db), current_user: schemas.User = Depends(oauth2.get_current_user)):
    return budget.destroy(id, db)


@router.put('/{id}', status_code=status.HTTP_202_ACCEPTED)
def update(id: int, request: schemas.BudgetCreate, db: Session = Depends(get_db), current_user: schemas.User = Depends(oauth2.get_current_user)):
    return budget.update(id, request, db)


@router.get('/{id}', status_code=200, response_model=schemas.BudgetCreate)
def show(id: int, db: Session = Depends(get_db), current_user: schemas.User = Depends(oauth2.get_current_user)):
    return budget.show(id, db)
