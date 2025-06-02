import 'dart:io';

import 'package:expense_tracker/app/provider/homeprovider.dart';
import 'package:expense_tracker/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formkey = GlobalKey<FormState>();

  DateTime? dateOfBirth;
  File? image;

  pickimage() async {
    final imagepicker = ImagePicker();
    final pickedFile = await imagepicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        pickimage();
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: image == null
                                ? const AssetImage(Appimage.myprofileimage)
                                : FileImage(image!),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14, bottom: 4),
                    child: Text(
                      "First Name:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your name";
                      }
                      return null;
                    },
                    controller: provider.name,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14, bottom: 4, top: 12),
                    child: Text(
                      "Email id:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter an email";
                      }
                      if (!value.contains('@')) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    controller: provider.email,
                    decoration: InputDecoration(
                      hintText: 'Enter your email id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14, bottom: 4, top: 12),
                    child: Text(
                      "Mobile Number:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your mobile number";
                      }
                      if (value.length != 10) {
                        return "Enter valid mobile number";
                      }
                      return null;
                    },
                    controller: provider.mobile,
                    decoration: InputDecoration(
                      hintText: 'Enter your Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14, bottom: 4, top: 12),
                    child: Text(
                      "Date of Birth:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: dateOfBirth ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        setState(() {
                          dateOfBirth = pickedDate;
                          provider.dob.text = pickedDate.toString();
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        validator: (value) {
                          if (dateOfBirth == null) {
                            return "Select a date";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month),
                          hintText: provider.dob.text.isEmpty
                              ? 'Date'
                              : provider.dob.text.substring(0, 10),
                          // : '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        provider.saveprofile(context);
                      }
                    },
                    child: Container(
                      height: 53,
                      width: 370,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          "Save changes",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
