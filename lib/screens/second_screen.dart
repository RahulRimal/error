import 'package:error/screens/second_screen.dart';
import 'package:error/view_models/first_screen_view_model.dart';
import 'package:error/view_models/second_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with WidgetsBindingObserver {
  late SecondScreenViewModel testViewModel;

  @override
  void initState() {
    super.initState();
    testViewModel = Provider.of<SecondScreenViewModel>(context, listen: false);

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testViewModel.init();
    });
  }

  @override
  void dispose() {
    testViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SecondScreenViewModel _testViewModel =
        context.watch<SecondScreenViewModel>();

    return Scaffold(
      body: _buildUI(_testViewModel),
    );
  }

  _buildUI(SecondScreenViewModel _testViewModel) {
    if (_testViewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_testViewModel.data.isEmpty) {
      return const Center(
        child: Text(
          "No data to show",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 20.0),
        child: ListView.builder(
          itemCount: _testViewModel.data.length,
          itemBuilder: (context, index) => Text(_testViewModel.data[index]),
        ),
      ),
    );
  }
}
