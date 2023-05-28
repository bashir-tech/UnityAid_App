import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:loging_page/service/autho_method.dart';

import '../models/user.dart';

class UserProviders with ChangeNotifier {
  Users? _user;
  final Authomethod _authomethod = Authomethod();

  Users get getUser => _user!;

  Future<void> refreshUser() async {
    Users user = await _authomethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
