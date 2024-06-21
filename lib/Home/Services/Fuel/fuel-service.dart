import 'package:final_one/Home/Services/Fuel/Fuel.dart';
import 'package:flutter/material.dart';
import '../../../Api_Manager.dart';
import '../category_widget.dart';


class FuelService extends StatefulWidget {
  static const String RouteName = 'Fuel';

  @override
  State<FuelService> createState() => _FuelServiceState();
}

class _FuelServiceState extends State<FuelService> {
  final ApiManager apiManager = ApiManager();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Service'),
      ),
      body: FutureBuilder<Fuel>(
        future: apiManager.FuelService(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final technicians = snapshot.data?.service?.technicians ?? [];
            final serviceId = snapshot.data?.service?.id ?? '';
            return ListView.builder(
              itemCount: technicians.length,
              itemBuilder: (context, index) {
                final technician = technicians[index];
                return CategoryServiceWidget(
                  name: 'Eng/'+technician.name! ,
                  phone: 'Phone/'+technician.phone! , serviceId: serviceId,

                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
