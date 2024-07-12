// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';



// class SignUpBegin extends StatefulWidget {
//   const SignUpBegin({super.key});

//   @override
//   State<SignUpBegin> createState() => _SignUpBeginState();
// }

// class _SignUpBeginState extends State<SignUpBegin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CarouselSlider(
//               items: [
//                 Image.asset('images/image1.jpg', fit: BoxFit.cover),
//                 Image.asset('images/image2.jpg', fit: BoxFit.cover),
//                 Image.asset('images/image3.jpg', fit: BoxFit.cover),
//               ],
//               options: CarouselOptions(
//                 height: 200,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               color: Colors.blue,
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'KYC Pending',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'You need to provide the required documents for your account activation',
//                     style: TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Click here',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 100,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: const [
//                   CircleAvatar(
//                     radius: 40,
//                     child: Icon(Icons.mobile_friendly),
//                   ),
//                   SizedBox(width: 16),
//                   CircleAvatar(
//                     radius: 40,
//                     child: Icon(Icons.laptop),
//                   ),
//                   SizedBox(width: 16),
//                   CircleAvatar(
//                     radius: 40,
//                     child: Icon(Icons.camera_alt),
//                   ),
//                   SizedBox(width: 16),
//                   CircleAvatar(
//                     radius: 40,
//                     child: Icon(Icons.tv),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               color: Colors.blue,
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Exclusive for you',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.arrow_forward, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   Container(
//                     width: 150,
//                     color: Colors.white,
//                     margin: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset('images/image1.jpg', fit: BoxFit.cover),
//                         const SizedBox(height: 8),
//                         const Text('Product 1'),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 150,
//                     color: Colors.white,
//                     margin: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset('images/image2.jpg', fit: BoxFit.cover),
//                         const SizedBox(height: 8),
//                         const Text('Product 2'),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 150,
//                     color: Colors.white,
//                     margin: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset('images/image3.jpg', fit: BoxFit.cover),
//                         const SizedBox(height: 8),
//                         const Text('Product 3'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.blue,
//         child: const Icon(Icons.chat, color: Colors.white),
//       ),
//     );
//   }
// }
