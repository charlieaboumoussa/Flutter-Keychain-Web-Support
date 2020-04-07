import 'dart:async';
import 'dart:convert';

import 'package:flutter_keychain/flutter_keychain.dart';

//todo discuss error handling

class UserRepository {
  static final String SP_TOKEN = "KEY";

  Future<Map<String, dynamic>> getToken() async {
    /// delete from keystore/keychain
    await FlutterKeychain.get(key: SP_TOKEN).then((token) {
      return (jsonDecode(token) as Map<String, dynamic>);
    });
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    return await FlutterKeychain.remove(key: SP_TOKEN);
  }

  void persistToken(Map<String, dynamic> token) async {
    /// write to keystore/keychain
    await FlutterKeychain.put(key: SP_TOKEN, value: jsonEncode(token));
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    //todo check shared preferences for login bool
    bool hasToken;
    await FlutterKeychain.get(key: SP_TOKEN).then((token) {
      if (token != null) {
        hasToken = true;
      } else {
        hasToken = false;
      }
    });
    return hasToken;
  }
}
