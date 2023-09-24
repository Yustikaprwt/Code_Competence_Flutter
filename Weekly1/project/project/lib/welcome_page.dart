import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _inquiryController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _inquiryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const formWidth = 350.0;
    const formHeight = 55.0;

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Welcome Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  height: 5,
                ),
              ),
            ),
            const Center(
              child: Image(
                image: AssetImage('assets/girl.png'),
                width: 300.0,
                height: 300.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Need to get in touch with us? Either fill out the form with your inquiry or find the department email you like to contact below.',
                style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: formWidth,
                height: formHeight,
                child: TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.black, height: 0.5),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: formWidth,
                height: formHeight,
                child: TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.black, height: 0.5),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: formWidth,
                height: formHeight,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black, height: 0.5),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: formWidth,
                height: formHeight,
                child: TextField(
                  controller: _inquiryController,
                  decoration: const InputDecoration(
                    labelText: 'What can we help you with?',
                    labelStyle: TextStyle(color: Colors.black, height: 0.5),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String firstName = _firstNameController.text;
                String lastName = _lastNameController.text;
                String email = _emailController.text;
                String inquiry = _inquiryController.text;

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Data Submitted'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('First Name: $firstName'),
                          Text('Last Name: $lastName'),
                          Text('Email: $email'),
                          Text('Inquiry: $inquiry'),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            _firstNameController.clear();
                            _lastNameController.clear();
                            _emailController.clear();
                            _inquiryController.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
