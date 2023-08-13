from typing import List, Optional
from pydantic import BaseModel

class BudgetBase(BaseModel):
    title: str
    amount: int
    tag: str
    user_id: int

class BudgetCreate(BudgetBase):
    class Config():
        orm_mode = True

class User(BaseModel):
    name: str
    email: str
    password: str

class ShowUser(BaseModel):
    name: str
    email: str
    budget_list: List[BudgetCreate] = []

    class Config():
        orm_mode = True

class Login(BaseModel):
    username: str
    password: str

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    email: Optional[str] = None
