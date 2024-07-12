import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
                  // child: Image.asset(
                  //   "lib/assets/image.png",
                  //   height: 50,
                  //   width: 50,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                hintText: "Search here",
                // fillColor: Colors.grey[600],
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
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: snapshot.getProductsModel!.data!.bannerOne!
                    .map((e) => Image.network(e.banner ?? ""))
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
                    color: Colors.blue,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'You need to provide the required\ndocuments for your account activation',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                            backgroundColor: Colors.blue,
                            radius: 35,
                            child: Icon(Icons.mobile_friendly),
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
                            backgroundColor: Colors.green,
                            radius: 35,
                            child: Icon(Icons.laptop),
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
                            backgroundColor: Colors.pink,
                            radius: 35,
                            child: Icon(Icons.camera),
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
                            backgroundColor: Colors.orange,
                            radius: 35,
                            child: Icon(Icons.abc_sharp),
                          ),
                          SizedBox(height: 18),
                          Text(
                            "Mobile",
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
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Exclusive for you',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward,
                                color: Colors.white),
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
                              .getProductsModel!.data!.brandListing!
                              .map(
                                (e) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: 150,
                                  margin: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30, top: 30),
                                                child: Image.network(
                                                    fit: BoxFit.cover,
                                                    e.icon ?? "")),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: const Text(
                                                    '32% off',
                                                    style: TextStyle(
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
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(e.label ?? ""),
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
        );
      }),
    );
  }
}
