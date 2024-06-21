import 'package:flutter/material.dart';
import '../../../Api_Manager.dart';
import '../category_widget.dart';
import 'Mechanical.dart';

class MechanicalService extends StatefulWidget {
  static const String RouteName = 'Mechanical';

  @override
  State<MechanicalService> createState() => _MechanicalServiceState();
}

class _MechanicalServiceState extends State<MechanicalService> {
  final ApiManager apiManager = ApiManager();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanical Service'),
      ),
      body: FutureBuilder<Mechanical>(
        future: apiManager.MechanicalService(),
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
