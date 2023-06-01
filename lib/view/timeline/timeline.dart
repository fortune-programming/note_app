import 'package:flutter/material.dart';

class SubmittedData {
  final String name;
  final String email;

  SubmittedData({required this.name, required this.email});
}

class SubmittedDataPage extends StatelessWidget {
  final SubmittedData submittedData;

  SubmittedDataPage({required this.submittedData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submitted Data'),
        backgroundColor: Color(0xFFE2D4BA),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${submittedData.name}'),
            Text('Email: ${submittedData.email}'),
            // Display more properties as needed
          ],
        ),
      ),
    );
  }
}

class SubmitDataForm extends StatefulWidget {
  @override
  _SubmitDataFormState createState() => _SubmitDataFormState();
}

class _SubmitDataFormState extends State<SubmitDataForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Data'),
        backgroundColor: Color(0xFFE2D4BA),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                SubmittedData submittedData =
                    SubmittedData(name: name, email: email);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SubmittedDataPage(submittedData: submittedData),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Data Submission',
    home: SubmitDataForm(),
  ));
}
