import 'package:final_one/Home/Acessories/Item_Accessories_Widget.dart';
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

  Future<Items> _loadData() async {
    return await apiManager.Product();
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
                            Text('92', style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Accessories", style: Theme.of(context).textTheme.titleLarge),
                FutureBuilder<Items>(
                  future: _loadData(),
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
