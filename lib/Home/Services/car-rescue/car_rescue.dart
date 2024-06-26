import 'package:final_one/Home/Services/car-rescue/Rescue.dart';
import 'package:flutter/material.dart';
import '../../../Api_Manager.dart';
import '../category_widget.dart';


class CarRescueService extends StatefulWidget {
  static const String RouteName = 'Rescue';

  @override
  State<CarRescueService> createState() => _CarRescueServiceState();
}

class _CarRescueServiceState extends State<CarRescueService> {
  final ApiManager apiManager = ApiManager();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Rescue Service'),
      ),
      body: FutureBuilder<Rescue>(
        future: apiManager.CarRescueService(),
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
                  name: technician.name ?? 'No Name',
                  phone: technician.phone ?? 'No Phone', serviceId: serviceId,

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
