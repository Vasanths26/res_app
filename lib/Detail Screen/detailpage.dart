import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {Key? key, required this.image, required this.text, required this.price})
      : super(key: key);
  final String image;
  final String text;
  final String price;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
    selected = 1;
  }

  void select(int index) {
    setState(() {
      selected = index;
    });
  }

  List<double> height = [50, 60, 70];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    widget.image,
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 58,
                left: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(88, 176, 173, 173),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: 30,
                child: Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 233, 114, 3),
                        size: 12.0,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "4.5",
                        style:
                            TextStyle(color: Color.fromARGB(255, 233, 114, 3)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Espresso",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      widget.text,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 233, 114, 3)),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Description",
              style: TextStyle(
                  color: Colors.brown.shade800, fontWeight: FontWeight.w900),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
                "It starts with finely ground espresso beans, which are tamped into a portafilter and brewed under pressure to produce a concentrated shot of espresso, milk is steamed to create a velvety texture and creamy consistency"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "See More",
              style:
                  TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Coffee Size",
              style: TextStyle(
                  color: Colors.brown.shade800, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Row(
                  children:
                      height.asMap().entries.map((MapEntry<int, double> entry) {
                    final int index = entry.key;
                    final double h = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        onTap: () {
                          select(index); // Pass index to select method
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected == index
                                ? Colors.amber
                                : Colors
                                    .transparent, // Apply amber color if selected
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/e9.png",
                              height: h,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 5),
                    const Text("1"),
                    const SizedBox(height: 5),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.black),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag, color: Colors.white),
                SizedBox(width: 8),
                Text("Add To bag", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
