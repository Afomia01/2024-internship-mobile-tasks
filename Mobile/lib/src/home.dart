import 'package:flutter/material.dart';
import 'package:myapp/src/update.dart';
import 'package:myapp/src/details.dart';
import 'package:myapp/src/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFCCCCCC), 
                ),
                height: 30,
                width: 50,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Text(
                          'August 2, 2024', 
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFAAB0B0), // Light gray color
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hello, ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF666666), // Dark gray color
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Yohannes', 
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFD9D9D9), // Light gray border
                    width: 1.0,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.notifications_outlined,
                      color: Color.fromARGB(255, 164, 157, 157), size: 30),
                  onPressed: () {
                    
                  },
                  iconSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available products',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(
                    width: 40, // Set a specific width for the container
                    height: 40, // Set a specific height for the container
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      border: Border.all(
                          color: const Color(0xFFD9D9D9),
                          width: 1), // Border color
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Search()), 
                        );
                      },
                      iconSize: 15, 
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), 
              children: const [
                ItemCard(),
                SizedBox(height: 16),
                ItemCard(),
                SizedBox(height: 16),
                ItemCard(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Update()), 
          );
        },
        backgroundColor: const Color(0xFF3F41F3), 
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        //make it circle
        shape: const CircleBorder(),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const Details()), // Navigate to DetailsPage
          );
        },
        child: Container(
          width: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage('assets/boot.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Derby Leather Shoes',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      '\$120',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Men\'s Shoe',
                      style: TextStyle(fontSize: 12),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromRGBO(255, 255, 0, 0.9),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.0',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
