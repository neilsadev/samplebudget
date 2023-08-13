from fastapi import FastAPI
import models
from database import engine
from routers import budget, user, authentication

# Create a FastAPI application instance
app = FastAPI()

# Create database tables based on the models
models.Base.metadata.create_all(engine)

# Include the authentication router
app.include_router(authentication.router)

# Include the blog router
app.include_router(budget.router)

# Include the user router
app.include_router(user.router)
