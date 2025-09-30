import 'package:flutter/material.dart';
import 'package:quiz_124230039/models/animallist.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _islike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dummyAnimals[widget.index].name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 169, 7, 48),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _islike = !_islike;
              });
            },
            icon: Icon(
              _islike ? Icons.favorite : Icons.favorite_border_outlined,
              color: Colors.red,
            ),
            tooltip: _islike ? 'Batal Suka' : 'Suka',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Table(
            columnWidths: {0: IntrinsicColumnWidth(), 1: FlexColumnWidth()},
            children: [
              TableRow(
                children: [
                  Text('Nama', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(': ${dummyAnimals[widget.index].name}'),
                ],
              ),
              TableRow(
                children: [
                  Text('Tipe', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(': ${dummyAnimals[widget.index].type}'),
                ],
              ),
              TableRow(
                children: [
                  Text('Berat', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(': ${dummyAnimals[widget.index].weight}'),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Habitat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(': ${dummyAnimals[widget.index].habitat}'),
                ],
              ),
              TableRow(
                children: [
                  Text('Tinggi', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(': ${dummyAnimals[widget.index].height}'),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Aktivitas',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(': ${dummyAnimals[widget.index].activities}'),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              launchurl();
            },
            child: Text("Buka Wikipedia"),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6, // 60% lebar layar
              child: Image.network(
                dummyAnimals[widget.index].image,
                fit: BoxFit.contain, // biar proporsional
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> launchurl() async {
    final url = Uri.parse('${dummyAnimals[widget.index].wikipedia}');

    if (await canLaunchUrl(url)) {
      //flutter pub add url_launcher di terminal
      await launchUrl(url);
    } else {
      throw 'rusak';
    }
  }
}
