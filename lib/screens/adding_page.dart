import 'package:flutter/material.dart';

class AddEarning extends StatelessWidget {
  const AddEarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আয় যোগ করুন'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add Earning Page'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2f59f6),
        onPressed: () {
          // Handle the button press
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ব্যয় যোগ করুন'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add Expenses Page'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2f59f6),
        onPressed: () {
          // Handle the button press
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


class AddDues extends StatelessWidget {
  const AddDues({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('বাকি যোগ করুন'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add Dues Page'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2f59f6),
        onPressed: () {
          // Handle the button press
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class AddProfit extends StatelessWidget {
  const AddProfit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('প্রফিট যোগ করুন'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add Profit Page'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2f59f6),
        onPressed: () {
          // Handle the button press
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

