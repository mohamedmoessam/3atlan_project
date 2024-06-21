import 'package:flutter/material.dart';
import 'package:final_one/Home/Services/Air/Air-service.dart';
import 'package:final_one/Home/Services/Car-wash/Car-wash.dart';
import 'package:final_one/Home/Services/Electrical/Electrical-service.dart';
import 'package:final_one/Home/Services/Fuel/fuel-service.dart';
import 'package:final_one/Home/Services/Mechanical/Mechanical_service.dart';
import 'package:final_one/Home/Services/Nitrogen/Nitrogen_service.dart';
import 'package:final_one/Home/Services/car-rescue/car_rescue.dart';
import 'package:final_one/Home/Model/Items.dart';
import 'package:final_one/Home/Services/Services_page.dart';
import '../Api_Manager.dart';
import 'Home_Widget.dart';
import '../../Theme.dart';

class Hometab extends StatefulWidget {
  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  final ApiManager apiManager = ApiManager();

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
      body: SafeArea(
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
                      serviceButton(context, 'Mechanical', 'assets/images/Mechanical.png', MechanicalService(), apiManager.MechanicalService),
                      serviceCircleButton(context, 'N', 'assets/images/Air.png', NitrogenService(), apiManager.NitrogenService),
                      serviceButton(context, 'Truck', 'assets/images/Truck.png', CarRescueService(), apiManager.CarRescueService),
                      serviceButton(context, 'Electrical', 'assets/images/Electrical.png', ElectricalService(), apiManager.ElectricalService),
                      serviceButton(context, 'Car Wash', 'assets/images/car_wash.png', CarWashService(), apiManager.CarWashService),
                      serviceButton(context, 'Air', 'assets/images/Air.png', AirService(), apiManager.AirService),
                      serviceCircleButton(context, '92', null, FuelService(), apiManager.FuelService),
                    ],
                  ),
                ),
                Text("Accessories", style: Theme.of(context).textTheme.titleLarge),
                FutureBuilder<Items>(
                  future: apiManager.Product(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData && snapshot.data!.products != null) {
                      return Column(
                        children: snapshot.data!.products!.map((product) {
                          return Accessories(
                            image: Image.network((product.image ?? ""), errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/placeholder.png'); // fallback image
                            }),
                            Name: product.name!,
                            Price: product.price!,
                            product: product,
                          );
                        }).toList(),
                      );
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget serviceButton(BuildContext context, String label, String assetPath, Widget page, Function apiCall) {
    return InkWell(
      onTap: () {
        apiCall();
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Services(image: Image.asset(assetPath)),
    );
  }

  Widget serviceCircleButton(BuildContext context, String label, String? assetPath, Widget page, Function apiCall) {
    return InkWell(
      onTap: () {
        apiCall();
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: CircleAvatar(
        radius: 40,
        backgroundColor: MyTheme.OrangeLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleLarge),
            if (assetPath != null) Image.asset(assetPath),
          ],
        ),
      ),
    );
  }
}
