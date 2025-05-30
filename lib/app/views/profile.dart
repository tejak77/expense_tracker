import 'package:expense_tracker/authentication/provider/authprovider.dart';
import 'package:expense_tracker/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DateTime? dateOfBirth;
  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(Appimage.myprofileimage),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 4),
                child: Text(
                  "First Name:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 4, top: 12),
                child: Text(
                  "Email id:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email id',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 4, top: 12),
                child: Text(
                  "Mobile Number:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:
                      provider.Profilenumber ?? 'Enter your Mobile Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 4, top: 12),
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
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText: dateOfBirth == null
                          ? 'Date'
                          : '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 53,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Save changes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
