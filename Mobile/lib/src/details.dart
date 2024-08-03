import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3, 
                  child: const Image(
                    image: AssetImage('assets/boot.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Men\'s Shoe',
                        style: TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color.fromRGBO(255, 255, 0, 0.9),
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '(4.0)',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Derby Leather',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '\$120',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16), // Space before the size buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    'Size:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 8), // Space before the button row
                SizedBox(
                  height: 56, // Height of the button row
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final size = 39 + index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: SizedBox(
                          width: 67, // Width of each button
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: size == 41 ? const Color(0xFF3F41F3) : Colors.white, // Background color
                              foregroundColor: size == 41 ? Colors.white : Colors.black, // Text color
                              elevation: 4, // Shadow to make the button feel floating
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0), // Rounded corners
                              ),
                            ),
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                size.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20), // Space before the description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20), // Space before the buttons
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 150, // Width for the button
                          height: 40, // Height for the button
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // White background
                              side: const BorderSide(color: Colors.red, width: 1.0), // Red border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                              ),
                              elevation: 4, 
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Delete',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 150, // Width for the button
                          height: 40, // Height for the button
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3F41F3), // Dark blue color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                              ),
                              elevation: 4, // Shadow to make the button feel floating
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8, // Position below the status bar
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(4.0), // Add padding to make the container slightly larger
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 20), // Smaller icon size
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
