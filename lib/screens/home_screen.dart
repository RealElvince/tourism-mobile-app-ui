import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourismapp/items/best_places.dart';
import 'package:tourismapp/items/favourites.dart';
import 'package:tourismapp/items/hotels.dart';
import 'package:tourismapp/items/most_visited.dart';
import 'package:tourismapp/items/new_added.dart';
import 'package:tourismapp/items/restaurants.dart';
import 'package:tourismapp/screens/post_screen.dart';
import 'package:tourismapp/widgets/home_appbar.dart';
import 'package:tourismapp/widgets/home_bottombar.dart';
import 'package:tourismapp/components/city_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: CustomHomeAppBar(),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200.0,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PostScreen(),
                                  ));
                            },
                            child: Container(
                              height: 160.0,
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.only(left: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/city${index + 1}.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                    opacity: 0.7),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // bookmark icon
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 1.0),
                                      child: Icon(
                                          Icons.bookmark_border_outlined,
                                          color: Colors.white,
                                          size: 25.0),
                                    ),
                                  ),
                                  const Spacer(),
                                  // City Name
                                  Consumer<CityNames>(
                                    builder: (context, value, child) {
                                      return Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Text(
                                            value.cityNames[index],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Category of best places,most visited etc
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      // BestPlaces Container
                      BestPlacesContainer(),
                      // Most Visited Container
                      MostVisitedContainer(),
                      //Favourites Container
                      FavouriteContainer(),
                      // New Added Container
                      NewAddedContainer(),
                      // Hotels Container
                      HotelsContainer(),
                      // Restaurants Container
                      RestaurantContainer()
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PostScreen()));
                          },
                          child: Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                  image:
                                      AssetImage('images/city${index + 1}.jpg'),
                                  fit: BoxFit.cover,
                                  opacity: 0.9),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Consumer<CityNames>(
                              builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  value.cityNames[index],
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Icon(
                                  Icons.more_vert,
                                  size: 30.0,
                                ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.0,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
