import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contacts_state_management.dart';

class Contacts extends StatelessWidget{

  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("***** build method *****");
    return Scaffold(
      appBar: AppBar(title: Text("Contacts"),),
      body: Padding(padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.grey,
              child:  Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.perm_contact_calendar),
                                hintText: "Insert your name",
                                labelText: "Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        SizedBox(width: 10),
                        MaterialButton(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.indigo,
                            textColor: Colors.white,
                            minWidth: 65,
                            onPressed: () {
                              Provider.of<ContactsStateManagement>(context, listen: false).addItemContact(textController.text==""?"?":textController.text);

                            },
                            child: Icon(Icons.add)),
                      ],
                    ),
                  )
              ),
            ),
            Expanded(
              child: Consumer<ContactsStateManagement>(
                builder: (context, contactStatue, child){
                  print("***** Consumer *****");
                  return ListView.builder(
                    itemCount: contactStatue.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(child: Text(contactStatue.data[index].substring(0,1)),),

                          title: Text(contactStatue.data[index]),
                          subtitle: child,
                        ),
                      );},
                  );
                },
                child: Text("Je reste fix hhhhhhhhhhhh"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}