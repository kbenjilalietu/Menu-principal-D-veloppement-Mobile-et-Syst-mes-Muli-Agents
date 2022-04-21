import 'package:ensemble_api_application/providers/covid_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Covid19 extends StatefulWidget {
  @override
  State<Covid19> createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  var country = ['Morocco','Egypt','China','India','United States','Indonesia',
    'Japan','Canada','Spain','Italy','	Germany','France','	Colombia','Iran'];
  var currentCountry = 'Morocco';

  TextEditingController contryController = new TextEditingController();

  var description = ["Time", "Confirmed", "Recovered", "Deaths"];

  var valueIcon = [
    Icons.access_time_sharp,
    Icons.sick_outlined,
    Icons.person,
    Icons.dangerous
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid-19"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 4,
                shadowColor: Colors.grey,
                child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 220,
                            height: 70,
                            child: InputDecorator(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: const Text(
                                      "Choose a country",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down_sharp),
                                    items: country.map((pays) {
                                      return DropdownMenuItem(
                                        value: pays,
                                        child: Text(
                                          pays,
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? choice) {
                                      setState(() {
                                        currentCountry = choice!;
                                      });
                                    }, value: currentCountry,
                                  ),
                                )),
                          ),
                          const SizedBox(width: 10),
                          MaterialButton(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              minWidth: 65,
                              onPressed: () {
                                Provider.of<CovidState>(context, listen: false)
                                    .searchCovid(currentCountry);
                              },
                              child: const Icon(Icons.search)),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 20, 4, 0),
                child: Container(
                    height: 350,
                    child: Card(
                      color: Colors.indigo,
                      child: GridView.count(
                          crossAxisCount: 2,
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          mainAxisSpacing: 6,
                          children: [
                            for (int i = 0; i < 4; i++)
                              Container(
                                  child: Card(
                                      elevation: 6,
                                      margin:
                                          const EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      color: Colors.white,
                                      child: Consumer<CovidState>(builder:
                                          (context, covidState, child) {
                                        return Column(children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Icon(
                                            valueIcon.elementAt(i),
                                            size: 40,
                                            color: const Color(0xffbac3fe),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            description.elementAt(i),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xffbac3fe)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            covidState.covidTest == null ||
                                                    covidState.covidTest[i] ==
                                                        null
                                                ? "?"
                                                : covidState.covidTest[i],
                                            style: const TextStyle(
                                                color: Colors.indigo,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]);
                                      })))
                          ]),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
