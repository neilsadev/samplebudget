from sqlalchemy.orm import Session
import models, schemas
from fastapi import HTTPException, status


def get_all(db: Session):
    budget_list = db.query(models.Budget).all()
    return budget_list


def create(request: schemas.BudgetCreate, db: Session):
    new_budget = models.Budget(title=request.title, amount=request.amount, tag = request.tag, user_id=request.user_id)
    db.add(new_budget)
    db.commit()
    db.refresh(new_budget)
    return new_budget


def destroy(id: int, db: Session):
    budget = db.query(models.Budget).filter(models.Budget.id == id)

    if not budget.first():
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail=f"Budget with id {id} not found"
        )

    budget.delete(synchronize_session=False)
    db.commit()
    return "done"


def update(id: int, request: schemas.BudgetCreate, db: Session):
    budget = db.query(models.Budget).filter(models.Budget.id == id)

    if not budget.first():
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail=f"Budget with id {id} not found"
        )
    budget.update(request.dict())
    db.commit()
    return "updated"


def show(id: int, db: Session):
    budget = db.query(models.Budget).filter(models.Budget.id == id).first()
    if not budget:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Budget with the id {id} is not available",
        )
    return budget
