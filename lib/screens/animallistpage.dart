import 'package:flutter/material.dart';
import 'package:quiz_124230039/models/animallist.dart';
import 'package:quiz_124230039/screens/detailpage.dart';
import 'package:quiz_124230039/screens/loginpage.dart';

class AnimalListPage extends StatelessWidget {
  const AnimalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal List Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'Daftar Hewan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 148, 127, 222),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return _animalcard(context, index);
                },
                itemCount: dummyAnimals.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _animalcard(context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(index: index);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 169, 7, 48),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      dummyAnimals[index].image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Text(
                dummyAnimals[index].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text('Tipe : ${dummyAnimals[index].type}'),
              Text("Habitat : ${dummyAnimals[index].habitat}"),
            ],
          ),
        ),
      ),
    );
  }
}
