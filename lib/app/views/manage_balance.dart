import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageBalance extends StatelessWidget {
  const ManageBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 32,
                ),
                const Text(
                  "Manage your Cash Balance",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Enter the allocated amount for this month",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  controller: provider.income1,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 20),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (provider.income1.text.isNotEmpty) {
                            provider.saveincome1();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Enter value")));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 46,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
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
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: '\$ 8500.00',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Add additional income"),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.number,
                  controller: provider.income2,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (provider.income2.text.isNotEmpty) {
                            provider.saveincom2();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Enter value")));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            height: 47,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      hintText: '\$ 8500.00',
                      hintStyle: const TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (provider.income1.text.isNotEmpty &&
                        provider.income2.text.isNotEmpty) {
                      provider.saveincome1();
                      provider.saveincom2();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter both values")));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
