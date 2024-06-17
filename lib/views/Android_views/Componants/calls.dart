// lib/Calls.dart
import 'package:flutter/material.dart';
import 'package:platform_converter_app/Providers/callDataProvider.dart';
import 'package:provider/provider.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call History"),
      ),
      body: Consumer<CallDataProvider>(
        builder: (context, provider, child) {
          if (provider.callHistory.isEmpty) {
            return Center(child: Text("No calls made yet"));
          }
          return ListView.builder(
            itemCount: provider.callHistory.length,
            itemBuilder: (context, index) {
              final call = provider.callHistory[index];
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(call.name),
                    subtitle: Text(call.contact),
                    trailing: Text(
                      "${call.timestamp.hour}:${call.timestamp.minute}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
