from rest_framework.response import Response


def create_response(status: int, code, success: bool, data: any, error_code, error: any):
    """
	To create a response dict
	Args:
		status (int): _description_
		code (ResponseCodes): _description_
		success (bool): _description_
		data (any): _description_
		error (any): _description_
	Returns:
		response: dict
    """

    response = {
        "status": status,
        "response_code": code,
        "success": success,
        "data": data,
        "error_code": error_code,
        "error": error
    }

    return Response(response, status=status, headers={'Access-Control-Allow-Origin': '*'})