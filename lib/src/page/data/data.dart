class SomService{
  SomService._internal();
  static final SomService _instance = SomService._internal();
  factory SomService()=> _instance;

 bool isLoggedIn = false;

  Map<String, dynamic> userObj={};
  // Map userObj={};
} 