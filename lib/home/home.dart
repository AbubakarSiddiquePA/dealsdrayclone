import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:dealsdray/auth/auth_provider/auth_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    Future.microtask(() async {
      await authProvider.getProductDetails(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Icon(Icons.menu),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(color: Colors.grey, Icons.search),
                prefixIcon: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "images/searchIcon.jpg",
                    // height: 25,
                    // width: 10,
                    fit: BoxFit.cover,
                  ),
                ),
                hintText: "Search here",
                fillColor: Colors.grey[200],
                filled: true,
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          )),
          const Icon(Icons.notifications),
        ]),
      ),
      body: Consumer<AuthProvider>(builder: (context, snapshot, _) {
        return snapshot.getProductsModel != null
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: snapshot.getProductsModel!.data.bannerOne
                          .map((e) => Image.network(e.banner))
                          .toList(),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 91, 116, 240),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'KYC Pending',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'You need to provide the required\ndocuments for your account activation',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Click here',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        height: 130,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 91, 116, 240),
                                  radius: 35,
                                  child: Icon(
                                    Icons.mobile_friendly,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 18),
                                Text(
                                  "Mobile",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(width: 18),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(247, 69, 181, 73),
                                  radius: 35,
                                  child: Icon(
                                    Icons.laptop,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 18),
                                Text(
                                  "Laptop",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(width: 18),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 245, 120, 162),
                                  radius: 35,
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 18),
                                Text(
                                  "Camera",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(width: 18),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 251, 157, 15),
                                  radius: 35,
                                  child: Icon(
                                    FontAwesomeIcons.lightbulb,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 18),
                                Text(
                                  "LED",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 82, 160, 170),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Exclusive for you',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward,
                                      size: 35, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot
                                    .getProductsModel!.data.brandListing
                                    .map(
                                      (e) => Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        width: 150,
                                        margin: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30,
                                                              top: 30),
                                                      child: Image.network(
                                                          fit: BoxFit.cover,
                                                          e.icon)),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        height: 30,
                                                        width: 60,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Text(
                                                          e.offer ?? "",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 45),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.label,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: bottomPadding),
                  ],
                ),
              )
            : const SizedBox();
      }),
    );
  }
}
