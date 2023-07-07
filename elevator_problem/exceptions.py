"""
Module containing all Custom Exceptions
"""

class BusinessException(Exception):
    """
    User defined function to handle 4xx response
    """
    def __init__(self, message):
        super().__init__(message)