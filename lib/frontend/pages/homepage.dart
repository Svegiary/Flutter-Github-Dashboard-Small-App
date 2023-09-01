//This is the homepage that just contains the
//search field
//each user search is then pushed to a new route

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(); //controller for the text field

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Github Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Row(
          children: [
            Expanded(
              flex: 3,
              //Text field searches for the Github user when the app user
              //submits the request from their keyboards by pressing the
              //done button
              child: TextField(
                decoration: const InputDecoration(
                    label: Text("Seach for user"),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )),
                controller: controller,
                onSubmitted: (value) => Navigator.of(context).pushNamed('/profile', arguments: value),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // the app user can also submit the request by
                  // pressing the search icon
                  String value = controller.text;
                  Navigator.of(context).pushNamed('/profile', arguments: value);
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
