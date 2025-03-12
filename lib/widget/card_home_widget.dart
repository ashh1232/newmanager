import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final List data;
  final int index;

  const HomeCard({super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(4.0, 4.0), // changes position of shadow
            // changes position of shadow
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(-4.0, -4.0), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Card(
            color: Colors.grey[300],
            elevation: 0,
            child: SizedBox(
              height: 145,
              // width: 100,
              child: Image.network(
                // snapshot.data!['data'][index]['product_image3'],
                data[index]['product_image'] ??
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/800px-Google_Chrome_icon_%28February_2022%29.svg.png',

                fit: BoxFit.fitHeight, // How the image fits in the box
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image loaded
                  }
                  return CircularProgressIndicator(); // Show loading
                },
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    // width: 100,
                    child: Center(child: Text('no data')),
                    // Image.network(
                    //   'https://cdn.iconscout.com/icon/premium/png-256-thumb/broken-15-85706.png',

                    //   fit: BoxFit.cover, // How the image fits in the box
                    // ),
                  ); // Show error
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              height: 35,
              width: 120,
              decoration: BoxDecoration(
                boxShadow: List.filled(
                  4,
                  BoxShadow(
                    color: const Color.fromARGB(36, 107, 107, 107),
                    blurRadius: 7,
                    offset: Offset(-4, 4),
                    spreadRadius: 1,
                  ),
                ),
                border: Border(
                  bottom: BorderSide(),
                  left: BorderSide(),
                  top: BorderSide(),
                ),
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(162, 255, 255, 255),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${data[index]['product_price']}'),
                  Text(data[index]['product_name'] ?? 'no name'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
