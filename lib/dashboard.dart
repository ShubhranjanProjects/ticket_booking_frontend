import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormBuilderState>();
  var options = ["Book Train Ticket", "Check PNR Status", "Live Train Status"];
  final now = DateTime.now();
  OutlineInputBorder borderStyle({bool isError = false}) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: isError ? Colors.red : Colors.deepPurpleAccent,
            width: isError ? 1 : 0.5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.train_outlined),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.airplane_ticket_outlined),
                ),
                Tab(
                  icon: Icon(Icons.train_outlined),
                ),
                Tab(
                  icon: Icon(Icons.bus_alert_outlined),
                ),
                Tab(
                  icon: Icon(Icons.car_rental_outlined),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content for the first tab
                  const Center(child: Text('Airplane')),
                  // Content for the second tab
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 50),
                      child: Column(
                        children: [
                          FormBuilderRadioGroup(
                            name: 'Radio',
                            wrapAlignment: WrapAlignment.spaceEvenly,
                            decoration: InputDecoration(
                              enabledBorder: borderStyle(),
                              errorBorder: borderStyle(isError: true),
                              focusedBorder: borderStyle(),
                              focusedErrorBorder: borderStyle(),
                              border: InputBorder.none,
                              label: const LabelTextWidget(
                                fieldDisplayName: 'ACTION',
                                isRequired: true,
                              ),
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            options: (options as List<dynamic>).map((option) {
                              return FormBuilderFieldOption<String>(
                                value: option,
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            width: 1900,
                            height: 250,
                            // color: Colors.red,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 40, horizontal: 40),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 169, 166, 166))),
                                // child: Row(
                                //   children: [
                                //     Container(
                                //       width: 270,
                                //       height: 200,
                                //       child: Text('From'),
                                //       // color: Colors.red,
                                //     ),
                                //     Container(
                                //       width: 270,
                                //       height: 200,
                                //       child: Text('To'),
                                //       // color: Colors.red,
                                //     ),
                                //     Container(
                                //       width: 270,
                                //       height: 200,
                                //       child: Text('Date'),
                                //       // color: Colors.red,
                                //     ),
                                //     Container(
                                //       width: 270,
                                //       height: 200,
                                //       child: Text('Class'),
                                //       // color: Colors.red,
                                //     ),
                                //   ],
                                // ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 250,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Text('From'),
                                          Text(
                                            'NEW DELHI',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    VerticalDivider(), // Add vertical line
                                    Container(
                                      width: 250,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Text('To'),
                                          Text(
                                            'CUTTACK',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    VerticalDivider(), // Add vertical line
                                    Container(
                                      width: 250,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Text('Date'),
                                          Text(
                                            now.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    VerticalDivider(), // Add vertical line
                                    Container(
                                      width: 250,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Text('Class'),
                                          Text(
                                            'SLEEPER',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      )),
                  // Content for the third tab
                  const Center(child: Text('Bus')),
                  // Content for the fourth tab
                  const Center(child: Text('Car')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelTextWidget extends StatelessWidget {
  final String fieldDisplayName;
  final bool isRequired;
  const LabelTextWidget(
      {super.key, required this.fieldDisplayName, required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: fieldDisplayName,
      children: [
        if (isRequired == true)
          const TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
      ],
    ));
  }
}
