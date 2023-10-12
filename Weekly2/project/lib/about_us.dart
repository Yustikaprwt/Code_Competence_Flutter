import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.amber,
      body: ServiceList(),
    );
  }
}

class ServiceList extends StatelessWidget {
  final List<ServiceItem> serviceItems = [
    ServiceItem(
      image: 'assets/service_1.jpg',
      title: 'Clean Your House',
      price: '\$15',
    ),
    ServiceItem(
      image: 'assets/service_2.jpg',
      title: 'Your Personal Driver',
      price: '\$20',
    ),
    ServiceItem(
      image: 'assets/service_3.jpg',
      title: 'Delivery Your Food',
      price: '\$20',
    ),
    ServiceItem(
      image: 'assets/service_4.jpg',
      title: 'Send Your Packages',
      price: '\$30',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(13.0),
          child: Text(
            'ABOUT US',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Welcome to our About Us page where we take pride in offering a wide range of services to cater to your needs. Our dedicated team is here to provide you with high-quality services that ensure your convenience and satisfaction. ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
        ...serviceItems.map((item) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: const Color(0xffE85B32),
              elevation: 4,
              child: Column(
                children: [
                  Image.asset(item.image, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Price: ${item.price}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Detail',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}

class ServiceItem {
  final String image;
  final String title;
  final String price;

  ServiceItem({
    required this.image,
    required this.title,
    required this.price,
  });
}
