import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  final _storage = const FlutterSecureStorage();

  Future writeFacilitiesData (String key,String value) async{
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readFacilitiesData (String key) async{
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteFacilitiesData (String key) async{
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  Future writeServicesData (String key,String value) async{
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readServicesData (String key) async{
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteServicesData (String key) async{
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  Future writeUserData (String key,String value) async{
    var writeUserData = await _storage.write(key: key, value: value);
    return writeUserData;
  }

  Future readUserData (String key) async{
    var readUserData = await _storage.read(key: key);
    return readUserData;
  }

}