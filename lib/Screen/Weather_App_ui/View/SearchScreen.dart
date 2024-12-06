import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/WeatherProvider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor: Colors.blue,
        title: const Text(
          'Search Weather',
          style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w500,letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                hintStyle: TextStyle(
                  fontSize: 20,
                  // color: Colors.blue.shade400
                ),

                prefixIcon: const Icon(Icons.search_sharp, color: Colors.blue,size: 40,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blue.shade200,
                    width: 2
                  )
                ),
                enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.blue.shade100,
                        width: 2
                    )
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (searchController.text.isNotEmpty) {
                  final searchResult =  weatherProvider.search =searchController.text;
                  if (searchResult != null) {
                    Navigator.of(context).pushNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("City not found! Please try again."),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a city name."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
