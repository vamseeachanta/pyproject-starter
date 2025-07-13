# pyproject_starter package

from loguru import logger
import os

# Ensure logs directory exists
os.makedirs(os.path.join(os.path.dirname(__file__), '../../logs'), exist_ok=True)
logger.add(os.path.join(os.path.dirname(__file__), '../../logs/pyproject_starter.log'), rotation="1 MB", retention="10 days", level="INFO")
