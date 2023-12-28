class RequestException {
  static String getError({Map? data, String? defaultMessage}){

    if(data!['fieldErrors'] is Map && (data['fieldErrors'] as Map).isNotEmpty){
      Map message = data['fieldErrors']['message'][0];

      return message.toString();
    }else{
      return data['description'] ?? defaultMessage;
    }
  }
}