import 'package:flutter/material.dart';
import 'package:final_one/Home/Acessories/lantern_accessories.dart';
import 'package:final_one/Home/Services/Services_page.dart';
import 'Acessories/Exhaust_Accessories.dart';
import 'Acessories/Oil_Accessories.dart';
import 'Acessories/car_tire.dart';
import 'Home_Widget.dart';
import '../../Theme.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  Future<void> _loadData() async {
    // Simulate a network delay or data fetching
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyTheme.PrimaryLight,
        elevation: 0,
        title: Center(child: Image.asset('assets/images/logo_light.png')),
      ),
      body: FutureBuilder<void>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while waiting for the future to complete
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle any errors that occurred during the future
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Once the future completes, build the main content
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Car Services & Repair", style: Theme.of(context).textTheme.titleLarge),
                      Image.asset('assets/images/home1.png'),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text("Services", style: Theme.of(context).textTheme.titleLarge),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(ServiceScreen.RouteName);
                            },
                            child: Text('See All', style: TextStyle(color: MyTheme.BlackLight)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.BabyBlueLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Services(image: Image.asset('assets/images/Mechanical.png')),
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: MyTheme.OrangeLight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('N', style: Theme.of(context).textTheme.titleMedium),
                                  Image.asset('assets/images/Air.png'),
                                ],
                              ),
                            ),
                            Services(image: Image.asset('assets/images/Truck.png')),
                            Services(image: Image.asset('assets/images/Electrical.png')),
                            Services(image: Image.asset('assets/images/car_wash.png')),
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: MyTheme.OrangeLight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/Electrical.png', width: 20, height: 20),
                                  Image.asset('assets/images/Air.png'),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: MyTheme.OrangeLight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('92', style: Theme.of(context).textTheme.titleLarge)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Accessories", style: Theme.of(context).textTheme.titleLarge),
                      Accessories(
                        image: Image.asset('assets/images/car_tire.png'),
                        Name: 'Car Tire',
                        Price: 300,
                        RouteName: CarTireScreen.RouteName,
                      ),
                      Accessories(
                        image: Image.asset('assets/images/exhaust.png'),
                        Name: 'Exhaust',
                        Price: 300,
                        RouteName: ExhaustScreen.RouteName,
                      ),
                      Accessories(
                        image: Image.asset('assets/images/oil.png'),
                        Name: 'Car Oil',
                        Price: 300,
                        RouteName: OilScreen.RouteName,
                      ),
                      Accessories(
                        image: Image.asset('assets/images/lantern.png'),
                        Name: 'Car Lantern',
                        Price: 300,
                        RouteName: lanternScreen.RouteName,
                      ),
                      Accessories(
                        image: Image.asset('assets/images/phone.png'),
                        Name: 'Phone Holder',
                        Price: 300,
                        RouteName: '',
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}