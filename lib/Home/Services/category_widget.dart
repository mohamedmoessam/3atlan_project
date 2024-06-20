import 'package:final_one/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Theme.dart';
import '../../../Api_Manager.dart';

class CategoryServiceWidget extends StatefulWidget {
  final String name;
  final String phone;
  final String serviceId;

  CategoryServiceWidget({
    required this.name,
    required this.phone,
    required this.serviceId,
  });

  @override
  State<CategoryServiceWidget> createState() => _CategoryServiceWidgetState();
}

class _CategoryServiceWidgetState extends State<CategoryServiceWidget> {
  final ApiManager apiManager = ApiManager();
  String _userId = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString('id') ?? ''; // Ensure the key is 'id'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyTheme.OrangeLight,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: MyTheme.PrimaryLight,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: MyTheme.BlackLight,
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.phone,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      bool success = await apiManager.bookService(
                        userId: _userId,
                        serviceId: widget.serviceId,
                      );
                      if (success) {
                        Navigator.of(context).pushNamed(HomeScreen.RouteName);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Booking successful')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Booking failed')),
                        );
                        print('User ID: $_userId');
                        print('Service ID: ${widget.serviceId}');
                      }
                    },
                    child: Text(
                      'Book',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(110.0, 35.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: MyTheme.BabyBlueLight,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
