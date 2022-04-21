import 'package:flutter/cupertino.dart';

class ContactsStateManagement extends ChangeNotifier{
  List<String> data = [];
  void addItemContact(String contact)
  {

       data.add(contact);
    notifyListeners();
  }
}