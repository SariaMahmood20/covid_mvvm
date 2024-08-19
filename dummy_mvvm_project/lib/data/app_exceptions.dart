

class AppExceptions implements Exception{

  String? message;
  String? prefix;

  AppExceptions(this.message, this.prefix);

  String toString(){
    return "$message";
  }

}

class FetchDataException extends AppExceptions{

  FetchDataException([String? message]): super(message, "Error while communication");

}

class FetchBadRequestException extends AppExceptions{

  FetchBadRequestException([String? message]): super(message, "Bad Request Exception");

}

class FetchUnauthorisedAccess extends AppExceptions{

  FetchUnauthorisedAccess([String? message]): super(message, "Unauthorised Access");

}

class FetchInvalidInput extends AppExceptions{

  FetchInvalidInput([String? message]): super(message, "Invalid Input");

}



