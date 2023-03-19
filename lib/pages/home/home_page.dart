import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/poll.dart';
import '../my_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Poll>? _polls;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(Uri.parse('https://cpsu-test-api.herokuapp.com/api/polls'));
    setState(() {
      _isLoading = false;
      _polls = (json.decode(response.body) as List)
          .map((item) => Poll.fromJson(item))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          Image.network(
            'https://cpsu-test-api.herokuapp.com/images/election.jpg',
            fit: BoxFit.cover,
            height: 200,
          ),
          Expanded(
            child: Stack(
              children: [
                if (_polls != null) _buildList(),
                if (_isLoading) _buildProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      itemCount: _polls!.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_polls![index].question),
          subtitle: Text(_polls![index].choices.join(', ')),
        );
      },
    );
  }

  Widget _buildProgress() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('รอสักครู่', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
