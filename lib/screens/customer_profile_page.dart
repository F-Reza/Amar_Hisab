import 'package:flutter/material.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0);

    // Sync TabController and PageController
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.animateToPage(
          _tabController.index,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কাস্টোমার প্রোফাইল'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              // alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:  Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'নাম : জাহিদুল ইসলাম জাহিদ জাহিদুল ইসলাম',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'মোবাইল নাম্বার : 01712345678',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'ঠিকানা : ঢাকা, বাংলাদেশ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Divider(),
                  const Text(
                    'মোট বাকি : ৳ 5000 টাকা',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'মোট পরিশোধ : ৳ 5000 টাকা',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Divider(),
                  const Text(
                    'বকেয়া : ৳ 5000 টাকা',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // TabBar without AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              color: Colors.blueAccent,
              child: TabBar(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.orangeAccent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                dividerColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(text: 'বাকি'),
                  Tab(text: 'পরিশোধ'),
                ],
              ),
            ),
          ),
          // PageView for sliding screens
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.index = index;
              },
              children: [
                DuesSection(),
                PaidSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DuesSection extends StatelessWidget {
  const DuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 55,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8,),
                      leading: const Icon(Icons.pending_actions_sharp, color: Colors.orange),
                      title: const Text('৳ 1000 TK'),
                      subtitle: const Text('10/04/2025 | 05:30pm'),
                      trailing: Row(
                        spacing: 18,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    insetPadding: EdgeInsets.all(20),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: 16,
                                        bottom: 16,),
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('10/04/2025 | 05:30pm',
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              IconButton(
                                                icon: Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                // textAlign: TextAlign.start,
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(context).style,
                                                  children: [
                                                    TextSpan(
                                                      text: 'বিবরণ:\n',
                                                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                                    ),
                                                    TextSpan(
                                                      text: 'বাবত বিক্রয় ৩৪৩৪৩\nকম্পানি বাবত ৩৪৩৪৩\nব্যাংক বাবত ৩৪৩৪৩',
                                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                          Text('Amount: ৳ 1000979878 TK',
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              print('Tapped on item $index');
                            },
                            child: Icon(Icons.remove_red_eye, color: Colors.blue),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle edit action
                            },
                            child: const Icon(Icons.edit),
                          ),
                        ],
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
          _showAddIncomeDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  // Add this method to your widget class
  void _showAddIncomeDialog(BuildContext context) {
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
                      'বাকি যোগ করুন',
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
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Amount (৳)',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an amount';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: descriptionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'বিবরণ লিখুন',
                                border: OutlineInputBorder(),
                              ),
                              minLines: 3,
                              maxLines: 10,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a description';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Text("Date:"),
                                const SizedBox(width: 10),
                                TextButton(
                                  onPressed: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now(),
                                    );
                                    if (picked != null && picked != selectedDate) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.calendar_today),
                                  onPressed: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now(),
                                    );
                                    if (picked != null && picked != selectedDate) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
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
                              backgroundColor: const Color(0xFF2f59f6),
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
                            child: Text('যোগ', style: TextStyle(color: Colors.white,)),
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

class PaidSection extends StatelessWidget {
  const PaidSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 55,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8,),
                      leading: const Icon(Icons.monetization_on_outlined, color: Colors.green),
                      title: const Text('৳ 1000 TK'),
                      subtitle: const Text('10/04/2025 | 05:30pm'),
                      trailing: Row(
                        spacing: 12,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle edit action
                            },
                            child: const Icon(Icons.edit),
                          ),
                        ],
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
          _showAddIncomeDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  // Add this method to your widget class
  void _showAddIncomeDialog(BuildContext context) {
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
                      'পরিশোধ যোগ করুন',
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
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Amount (৳)',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an amount';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Text("Date:"),
                                const SizedBox(width: 10),
                                TextButton(
                                  onPressed: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now(),
                                    );
                                    if (picked != null && picked != selectedDate) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.calendar_today),
                                  onPressed: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now(),
                                    );
                                    if (picked != null && picked != selectedDate) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
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
                              backgroundColor: const Color(0xFF2f59f6),
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
                            child: Text('যোগ', style: TextStyle(color: Colors.white,)),
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