import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black), // Less than sign as back arrow
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Center(
          child: Text(
            'Add Product',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal, // Not bold
              fontFamily: 'Poppins', // Replace with Google Fonts later
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8), // Reduced space between the app bar and container
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3), // Updated gray color
                  borderRadius: BorderRadius.circular(14.0), // Slightly curved corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image, // Gallery or image icon with mountain-like lines
                      size: 50, // Smaller icon size
                      color: Colors.black,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'upload image',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildField('name'),
              const SizedBox(height: 16),
              _buildField('category'),
              const SizedBox(height: 16),
              _buildField('price'),
              const SizedBox(height: 16),
              _buildDescriptionField(),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: 377, // Width for the button
                  height: 44, // Height for the button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3F41F3), // Dark blue color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rectangle shape
                      ),
                    ),
                    onPressed: () {
                      // Handle Add button action
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0), // Space between Add and Delete buttons
              Center(
                child: SizedBox(
                  width: 377, // Width for the button
                  height: 44, // Height for the button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      side: const BorderSide(color: Colors.red, width: 1.0), // Red border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rectangle shape
                      ),
                    ),
                    onPressed: () {
                      // Handle Delete button action
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8), // Space between text and input field
        Container(
          width: double.infinity, // Extend the input field to be wider
          height: 40, // Height of the input field container
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3), // Updated gray color
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none, // Remove border from the input field
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8), // Space between text and input field
        Container(
          width: double.infinity, // Extend the input field to be wider
          height: 120, // Increased height for the description field
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3), // Updated gray color
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              maxLines: 5, // Allow multiple lines
              decoration: const InputDecoration(
                border: InputBorder.none, // Remove border from the input field
              ),
            ),
          ),
        ),
      ],
    );
  }
}
