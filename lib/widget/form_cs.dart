import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../theme.dart';

class FormCs extends StatefulWidget {
  const FormCs({Key? key}) : super(key: key);

  @override
  _FormCsState createState() => _FormCsState();
}

class _FormCsState extends State<FormCs> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> postData() async {
    const String apiUrl = 'https://backend.1wave.world/api/cs/contact';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'companyName': companyNameController.text,
          'contactName': contactNameController.text,
          'phone': phoneController.text,
          'email': emailController.text,
          'message': messageController.text,
        },
      );

      if (response.statusCode == 200) {
        // Handle response jika berhasil
        // print('Data berhasil dikirim!');
        _successDialog();

        _clearFields(); // Membersihkan isian setelah berhasil terkirim
      } else {
        // Handle response jika terjadi error
        print('Error: ${response.reasonPhrase}');
        _showDialog('Error', 'Failed to send message. Please try again.');
      }
    } catch (error) {
      print('Error: $error');
      _showDialog('Error', 'An error occurred. Please try again.');
    }
  }

  void _successDialog() {
    AwesomeDialog(
      width: 400,
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: true,
      title: 'Succes',
      desc: 'Form received! We\'ll reach out to you soon 😁',
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    ).show();
  }

  void _showDialog(String title, String content) {
    AwesomeDialog(
      width: 400,
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.error,
      showCloseIcon: true,
      title: title,
      desc: content,
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    ).show();
  }

  void _clearFields() {
    companyNameController.clear();
    contactNameController.clear();
    phoneController.clear();
    emailController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            child: Text(
              'Send us a Massage :',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInLeft(
            child: TextField(
              controller: companyNameController,
              decoration: InputDecoration(
                hintText: 'Your Company',
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
            child: TextField(
              controller: contactNameController,
              decoration: InputDecoration(
                hintText: 'Your Name',
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Your Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInRight(
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Your Mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address.';
                } else if (!_isValidEmail(value)) {
                  return 'Please enter a valid email address.';
                }
                return null; // Return null if the validation is successful.
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: TextField(
              controller: messageController,
              maxLines: 4,
              decoration: InputDecoration(
                hintStyle: subtitleTextStyle.copyWith(
                  fontWeight: medium,
                ),
                hintText: 'Type Your Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: titleColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return titleDarkColor; // Warna latar belakang saat tombol di-hover
                  }
                  return titleColor; // Warna latar belakang saat tidak di-hover
                },
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Atur border radius ke 20
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                postData();
              }
            },
            child: Text(
              'Send Message',
              style: titleTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
                letterSpacing: 2,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isValidEmail(String email) {
    // Simple email validation using a regular expression
    // You can use a more complex regex for a more accurate validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
