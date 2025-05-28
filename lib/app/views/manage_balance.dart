import 'package:flutter/material.dart';

class ManageBalance extends StatelessWidget {
  const ManageBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_back,
                size: 32,
              ),
              Text(
                "Manage your Cash Balance",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Enter the allocated amount for this month",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Container(
                        height: 46,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: '\$ 8500.00',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Add additional income"),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                        height: 47,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    hintText: '\$ 8500.00',
                    hintStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              Spacer(),
              Container(
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                height: 50,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
