import 'package:error/screens/second_screen.dart';
import 'package:error/view_models/first_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with WidgetsBindingObserver {
  late FirstScreenViewModel testViewModel;

  @override
  void initState() {
    super.initState();
    testViewModel = Provider.of<FirstScreenViewModel>(context, listen: false);

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
    FirstScreenViewModel _testViewModel = context.watch<FirstScreenViewModel>();

    return Scaffold(
      body: _buildUI(_testViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondScreen()));
        },
        child: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }

  _buildUI(FirstScreenViewModel _testViewModel) {
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
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20.0),
      child: ListView.builder(
        itemCount: _testViewModel.data.length,
        itemBuilder: (context, index) => Text(_testViewModel.data[index]),
      ),
    );
  }
}
