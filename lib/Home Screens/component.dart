import 'package:flutter/material.dart';

import '../Detail Screen/detailpage.dart';

class CoffeeList extends StatelessWidget {
  const CoffeeList({
    super.key,
    required this.image,
    required this.text,
    required this.price,
  });

  final List<String> image;
  final List<String> text;
  final List<String> price;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: image.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPage(image: image[index], price: price[index],text: text[index],)));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            height: 160,
            width: 170,
            child: Stack(
              children: [
                Positioned(
                  top: 90,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: 150,
                      width: 160,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Espresso',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.amber),
                              ),
                            ],
                          ),
                          Text(
                            text[index],
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                price[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.amber),
                                child: const Icon(Icons.add,
                                    size: 25, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 17,
                  child: Container(
                    height: 90,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(image[index], fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class TodaysDeal extends StatelessWidget {
  const TodaysDeal(
      {super.key,
      required this.prices,
      required this.reduced,
      required this.images,
      required this.name});
  final String prices;
  final String reduced;
  final String images;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 15, top: 10, right: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 249, 226, 186)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  images,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 110,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 14, color: Colors.amber),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        prices,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        children: [
                          Text(
                            reduced,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Transform.rotate(
                            angle: 0 * 3.14 / 180,
                            child: CustomPaint(
                              size: const Size(45, 20), // Adjust size as needed
                              painter: SlashPainter(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 30,
          right: 25,
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.amber),
            child: const Icon(Icons.add, size: 25, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class SlashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
