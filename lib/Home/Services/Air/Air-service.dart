import 'package:final_one/Home/Services/Air/Air.dart';
import 'package:flutter/material.dart';
import '../../../Api_Manager.dart';
import '../category_widget.dart';


class AirService extends StatefulWidget {
  static const String RouteName = 'Air';

  @override
  State<AirService> createState() => _AirServiceState();
}

class _AirServiceState extends State<AirService> {
  final ApiManager apiManager = ApiManager();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Service'),
      ),
      body: FutureBuilder<Air>(
        future: apiManager.AirService(),
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
