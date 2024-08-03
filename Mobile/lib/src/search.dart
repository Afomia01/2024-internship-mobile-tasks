import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  RangeValues _priceRange = RangeValues(0, 100);

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Transparent background
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the bottom sheet
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, 
            children: [
              const Text(
                'Category',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4.0), // Space between label and input
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0), // More compact padding
                ),
              ),
              const SizedBox(height: 6.0), // Space between input and price label
              const Text(
                'Price',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4.0), // Space between label and slider
              Container(
                width: double.infinity,
                child: SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 11, // Height of the slider track
                    activeTrackColor: const Color(0xFF3f41f3), 
                    inactiveTrackColor: const Color(0xFFD9D9D9), 
                    thumbColor: const Color(0xFF3f41f3), 
                    overlayColor: const Color(0x293f41f3), 
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                  ),
                  child: RangeSlider(
                    values: _priceRange,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    labels: RangeLabels(
                      _priceRange.start.round().toString(),
                      _priceRange.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _priceRange = values;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12.0), // Space between slider and button
              Center(
                child: SizedBox(
                  width: 377, // Width for the button
                  height: 44, // Height for the button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3f41f3), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), 
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                      // Handle apply button action
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black), // Back arrow
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Search Product',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal, // Not bold
              fontFamily: 'Poppins', // Replace with Google Fonts later
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 60, // Adjust height if needed
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4.0), // Space between the app bar and the search bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Leather',
                        hintStyle: const TextStyle(color: Colors.grey), // Light gray text
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.grey, width: 1.0), // Very light and thin border
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0), // More compact padding
                        suffixIcon: IconButton(
                          icon: Icon(Icons.arrow_forward, color: Color(0xFF3f41f3)),
                          onPressed: () {
                            // Handle search action
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Space between search bar and icon
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3f41f3), // Blue background color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_list, color: Colors.white), // Filter icon in white color
                      onPressed: _showFilterBottomSheet,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0), // Space between search bar and item cards
              Column(
                children: [
                  const ItemCard(),
                  const SizedBox(height: 8.0), // Space between item cards
                  // Updated to show description
                  const ItemCard(showDescription: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final bool showDescription;

  const ItemCard({super.key, this.showDescription = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 360,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage('assets/boot.jpg'),
                fit: BoxFit.cover,
                height: 160, // Increased height for the image
                width: double.infinity,
              ),
            ),
            if (showDescription) ...[
              const SizedBox(height: 4), // Further reduced space between image and text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Further reduced horizontal padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Derby Leather Shoes',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Further reduced font size
                    ),
                    Text(
                      '\$120',
                      style: TextStyle(fontSize: 12), // Reduced font size
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4), // Further reduced space between price and next row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Further reduced horizontal padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Men\'s Shoe',
                      style: TextStyle(fontSize: 10), // Reduced font size
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 255, 0, 0.9),
                          size: 18, // Reduced icon size
                        ),
                        SizedBox(width: 2), // Reduced space between icon and text
                        Text(
                          '4.0',
                          style: TextStyle(fontSize: 12), // Reduced font size
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
