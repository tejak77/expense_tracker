import 'package:expense_tracker/constant/images.dart';
import 'package:flutter/material.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  String? selectedValue;
  DateTime? selecedDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(Appimage.cross),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Add Transactions",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '\$ 8500.00',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 48,
                        minWidth: 62,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      hintText: 'Category',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Image.asset(
                        Appimage.categoryicon,
                        height: 30,
                        width: 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  items: ['Food', 'Shopping', 'Entertainment', 'Travel']
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  }),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 340,
                height: 100,
                child: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selecedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selecedDate = pickedDate;
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minHeight: 48,
                            minWidth: 62,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              Appimage.calendericon,
                              height: 10,
                              width: 10,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: selecedDate == null
                              ? 'Date'
                              : '${selecedDate!.day}/${selecedDate!.month}/${selecedDate!.year}'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 280,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 134, 227),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
