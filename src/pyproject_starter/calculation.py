

from . import logger

def pressure_pipe():
    """Returns and logs the value 10."""
    value = 10
    logger.info(f"pressure_pipe called, returning {value}")
    print(value)
    return value


__all__ = ['pressure_pipe']
