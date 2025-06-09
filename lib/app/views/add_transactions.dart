import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:expense_tracker/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(Appimage.cross),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add Transactions",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: provider.amount,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: '\$ 8500.00',
                      hintStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 22,
                        horizontal: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                      value: selectedValue,
                      decoration: InputDecoration(
                          prefixIconConstraints: const BoxConstraints(
                            minHeight: 48,
                            minWidth: 62,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          hintText: 'Category',
                          hintStyle: const TextStyle(
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
                          provider.category.text = newValue.toString();
                        });
                      }),
                  const SizedBox(
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
                            provider.date.text = pickedDate.toString();
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minHeight: 48,
                                minWidth: 62,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
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
                  const SizedBox(
                    height: 280,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (provider.amount.text.isNotEmpty &&
                          provider.category.text.isNotEmpty &&
                          provider.date.text.isNotEmpty) {
                        provider.transactions(context);
                        provider.savetransactions(
                            int.parse(provider.amount.text),
                            provider.category.text,
                            provider.date.text,
                            context);
                        setState(() {
                          selecedDate = null;
                          selectedValue = null;
                        });
                      }
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
