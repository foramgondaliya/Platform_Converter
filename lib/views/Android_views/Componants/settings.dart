import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/Providers/platformProvider.dart';
import 'package:provider/provider.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  late String date;
  late String time;

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime? pickDate;
  TimeOfDay? pickTime;

  @override
  void initState() {
    super.initState();
    date = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    if (dateTime.hour <= 12) {
      time = "${timeOfDay.hour} : ${timeOfDay.minute} AM";
    } else {
      time =
          "${dateTime.hour - 12} : ${dateTime.minute} ${timeOfDay.period.name}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlatformProvider>(context).isIOS)
        ? CupertinoPageScaffold(
            child: Text(""),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Setting",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            body: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        pickDate = await showDatePicker(
                          initialDate: dateTime,
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        );
                        if (pickDate != null) {
                          setState(() {
                            date =
                                "${pickDate!.day}/${pickDate!.month}/${pickDate!.year}";
                          });
                        }
                      },
                      child: Text("Pick Date"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        pickTime = await showTimePicker(
                            context: context, initialTime: timeOfDay);
                        setState(() {
                          if (pickTime != null) {
                            time =
                                "${pickTime!.hour}:${pickTime!.minute} ${pickTime!.period.name}";
                          }
                        });
                      },
                      child: Text("Pick Time"),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
