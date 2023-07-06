from enum import Enum


class ResponseCodes(str, Enum):
    SUCCESS = "SUCCESS"
    ERROR = "ERROR"
    UNAUTHORIZED = "user is not authorized for this operation"
    SOMETHING_WENT_WRONG = 'something went wrong while performing this operation'