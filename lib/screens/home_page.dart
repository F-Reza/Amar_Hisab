import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../providers/service_provider.dart';
import '../widgets/main_drawer.dart';
import 'earning_page.dart';


class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
  ];

  @override
  Widget build(BuildContext context) {
    final ServiceProvider provider = ServiceProvider();
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text('আমার হিসাব',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_graph_outlined),
            onPressed: () {
              _showAddIncomeDialog(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddEarning(),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'সর্বশেষ আয়\n৳ 4334 টাকা',
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddExpenses(),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'সর্বশেষ ব্যয়\n৳ 675 টাকা',
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddDues(),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'সর্বশেষ বকেয়া\n৳ 345 টাকা',
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddProfit(),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'সর্বশেষ প্রফিট\n৳ 645489789 টাকা',
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Half yearly sales analysis'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Initialize the spark charts widget
                  child: SfSparkLineChart.custom(
                    //Enable the trackball
                    trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap,
                    ),
                    //Enable marker
                    marker: SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all,
                    ),
                    //Enable data label
                    labelDisplayMode: SparkChartLabelDisplayMode.all,
                    xValueMapper: (int index) => data[index].year,
                    yValueMapper: (int index) => data[index].sales,
                    dataCount: 5,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 50,
        color: Colors.blueAccent,
        child: GestureDetector(
          onTap: () {
           provider.webLink('www.facebook.com/NextDigitOfficial/');
          },
          child: Center(
            child: Text(
              'Powered by নেক্সট ডিজিট',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Add this method to your widget class
  void _showAddIncomeDialog(BuildContext context) {
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
                padding: EdgeInsets.all(10),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'টোটাল ওভারভিউ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(Icons.event_note_rounded),
                      trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'মোট আয়\n৳ 4334 টাকা',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'মোট ব্যয়\n৳ 675 টাকা',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'মোট বকেয়া\n৳ 345 টাকা',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'মোট প্রফিট\n৳ 645489789 টাকা',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'মোট কাস্টমার\n 4334 জন',
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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


class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}