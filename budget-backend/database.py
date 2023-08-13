from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os
from dotenv import load_dotenv # type: ignore

load_dotenv()

# Add DB Link Here
SQLALCHEMY_DATABASE_URL = os.getenv('CONSTR')
print(SQLALCHEMY_DATABASE_URL)
# Create an engine for the database connection
engine = create_engine(SQLALCHEMY_DATABASE_URL)

# Create a session maker bound to the engine
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)

# Create a base class for declarative models
Base = declarative_base()


def get_db():
    """
    Create a new database session.

    Yields:
    - session: SQLAlchemy database session object.

    Usage:
    ```
    with get_db() as db:
        # Use the session for database operations
    # The session will be automatically closed after the `with` block
    ```

    Returns:
    - Generator: A generator that yields a database session.
    """
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
