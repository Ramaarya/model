import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Route name for this page
  static const routeName = '/home';

  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    // Create List Dummy Data
    List<ProductModel> dummyData = List.generate(100, (index) {
      return ProductModel(
        'https://picsum.photos/id/$index/300',
        faker.food.restaurant(),
        10000 + Random().nextInt(100000),
        faker.lorem.sentence(),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return GridTile(
            footer: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: Colors.blueAccent.withOpacity(0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${dummyData[index].title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Rp ${dummyData[index].price}'),
                  Text(
                    '${dummyData[index].desc}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            child: Image.network('${dummyData[index].imageUrl}'),
          );
        },
      ),
    );
  }
}
