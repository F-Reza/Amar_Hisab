import 'package:flutter/material.dart';
import '../providers/service_provider.dart';
import 'customer_profile.dart';

class AddDues extends StatefulWidget {
  const AddDues({super.key});

  @override
  State<AddDues> createState() => _AddDuesState();
}

class _AddDuesState extends State<AddDues> {
  final _searchController = TextEditingController();
  bool _isSearching = false;
  String searchVal = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      searchVal = '';
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ServiceProvider provider = ServiceProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text('বাকির হিসাব'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'আজকের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'গতকালের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'গত সাত দিনের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'চলতি মাসের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'গত মাসের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'গত ছয় মাসের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'চলতি বছরের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'গত বছরের বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'সর্বমোট বাকি\n৳ 4334 টাকা',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                height: 44,
                child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'খুঁজুন (নাম, মোবাইল)',
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), // Keep the border radius
                      borderSide: BorderSide.none, // Remove the border color
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.blue, size: 28),
                    suffixIcon: _isSearching
                        ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: _clearSearch,
                    )
                        : null,
                    contentPadding: EdgeInsets.only(top: 8),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchVal = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 55,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomerProfile(),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        title: const Text('মোঃ জাহিদুল ইসলাম (জাহিদ)'),
                        subtitle: const Text('মডেল বাঁজার পশ্চিম পাড়া'),
                        trailing: Row(
                          spacing: 12,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.dialCall('01830996044');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(Icons.call, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2f59f6),
        onPressed: () {
          _showAddNewCustomerDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Add this method to your widget class
  void _showAddNewCustomerDialog(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'নতুন কাস্টোমার যোগ করুন',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'নাম*',
                                hintText: 'নাম লিখুন',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'নাম লিখুন';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'ঠিকানা*',
                                hintText: 'ঠিকানা লিখুন',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'নাম লিখুন';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'মোবাইল',
                                hintText: 'মোবাইল নাম্বার লিখুন',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'বাতিল',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // Only proceed if validation passes
                                print('Amount: ${amountController.text}');
                                print('Description: ${descriptionController.text}');
                                print('Date: $selectedDate');
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text('সেভ', style: TextStyle(color: Colors.white,)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}