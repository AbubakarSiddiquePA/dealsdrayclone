// import 'package:flutter/material.dart';

// class Deals extends StatefulWidget {
//   const Deals({super.key});

//   @override
//   State<Deals> createState() => _DealsState();
// }

// class _DealsState extends State<Deals> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text("Deals Page"),
//       ),
//     );
//   }
// }

import 'package:dealsdray/auth/signup/signup_begin.dart';
import 'package:flutter/material.dart';

class LoginPhoneEmail extends StatefulWidget {
  const LoginPhoneEmail({super.key});

  @override
  State<LoginPhoneEmail> createState() => _LoginPhoneEmailState();
}

class _LoginPhoneEmailState extends State<LoginPhoneEmail> {
  bool isPhoneSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                "images/dealsDray.png",
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              // spacing: 8.0,
              children: [
                ChoiceChip(
                  backgroundColor: Colors.red,
                  label: Text('Phone'),
                  selected: !isPhoneSelected,
                  onSelected: (selected) {
                    setState(() {
                      isPhoneSelected = !selected;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Email'),
                  selected: isPhoneSelected,
                  onSelected: (selected) {
                    setState(() {
                      isPhoneSelected = selected;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Glad to see you!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isPhoneSelected
                      ? 'Please provide your phone number'
                      : 'Please provide your email',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: isPhoneSelected
                      ? TextInputType.phone
                      : TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: isPhoneSelected ? 'Phone' : 'Email',
                    // border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    // padding: EdgeInsets.(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    // Handle send code action
                  },
                  child: Text(
                    'Send Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpBegin(),
                          ));
                    },
                    child: Text("navigate"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
