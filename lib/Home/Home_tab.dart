import 'package:final_one/Home/Services/Air/Air-service.dart';
import 'package:final_one/Home/Services/Car-wash/Car-wash.dart';
import 'package:final_one/Home/Services/Electrical/Electrical-service.dart';
import 'package:final_one/Home/Services/Fuel/fuel-service.dart';
import 'package:final_one/Home/Services/Mechanical/Mechanical_service.dart';
import 'package:final_one/Home/Services/Nitrogen/Nitrogen_service.dart';
import 'package:final_one/Home/Services/car-rescue/car_rescue.dart';
import 'package:flutter/material.dart';
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

  // Future<Items> _loadData() async {
  //   return await apiManager.Product();
  // }

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
                      InkWell(
                        onTap: (){
                          apiManager.MechanicalService();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MechanicalService(),));

                        },
                          child: Services(image: Image.asset('assets/images/Mechanical.png'))),
                      InkWell(
                        onTap: (){
                          apiManager.NitrogenService();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NitrogenService(),));
                        },
                        child: CircleAvatar(
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
                      ),
                      InkWell(
                        onTap: (){
                          apiManager.CarRescueService();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CarRescueService(),));
                        },
                          child: Services(image: Image.asset('assets/images/Truck.png'))),
                      InkWell(
                        onTap: (){
                          apiManager.ElectricalService();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ElectricalService(),));
                        },
                          child: Services(image: Image.asset('assets/images/Electrical.png'))),
                      InkWell(
                        onTap: (){
                       apiManager.CarWashService();
                           Navigator.push(context, MaterialPageRoute(builder: (context) => CarWashService(),));


                        },
                          child: Services(image: Image.asset('assets/images/car_wash.png'))),
                      InkWell(
                        onTap: (){
                        apiManager.AirService();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AirService(),));

                        },
                        child: Services(
                          image: Image.asset('assets/images/Air.png')
                        )
                      ),
                      InkWell(
                        onTap: (){
                           apiManager.FuelService();
                           Navigator.push(context, MaterialPageRoute(builder: (context) => FuelService(),));




                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: MyTheme.OrangeLight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('92', style: Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                        ),
                      ),
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
                            image: Image.network((product.image??"")),
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
}
