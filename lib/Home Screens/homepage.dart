import 'package:coffe_app/Home%20Screens/bottom_nav.dart';
import 'package:flutter/material.dart';

import 'component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController search = TextEditingController();

  final List<String> text = [
    'Filter',
    'Espresso',
    'Capuccino',
    'Latte',
    'Cold Coffee'
  ];

  final List<double> width = [
    100,
    100,
    100,
    60,
    100,
  ];

  final List<IconData> icon = [
    Icons.home_outlined,
    Icons.favorite_border_outlined,
    Icons.shopping_bag_outlined,
    Icons.person_outline
  ];

  final List<String> text1 = ['Home', 'Favorite', 'Shop', 'account'];

  final List<String> image = [
    'assets/e1.jpeg',
    'assets/e2.webp',
    'assets/e3.webp'
  ];

  final List<String> text2 = [
    'with Milk',
    'with Cream+Cookies',
    'without Milk'
  ];

  final List<String> name = [
    'BigMac + Fries',
    'BigMac + Fries + Coke',
    'Extra Cheese Pizza',
    'Pizza + Coke',
  ];

  final List<String> images = [
    'assets/e4.jpeg',
    'assets/e5.jpeg',
    'assets/e6.jpeg',
    'assets/e7.jpeg',
  ];
  final List<String> prices = [
    '\$12.75',
    '\$13.75',
    '\$15.55',
    '\$16.75',
  ];
  final List<String> reducedPrices = [
    '\$20.55',
    '\$22.25',
    '\$24.55',
    '\$25.75',
  ];

  final List<String> price = ['\$6.75', '\$7.55', '\$6.15'];
  int selectedIndex = 1;
  int bottomPage = 0;
  void iniState() {
    selectedIndex = 1;
  }

  void select(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomIcon(int index) {
    setState(() {
      bottomPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.only(left: 15),
                              margin:
                                  const EdgeInsets.only(right: 15, left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: search,
                                      style: const TextStyle(fontSize: 16,color: Colors.amber),
                                      keyboardType: TextInputType.text,
                                      textAlign: TextAlign.left,
                                      decoration: const InputDecoration(

                                        hintText: 'Search cafe or coffee',
                                        hintStyle: TextStyle(
                                            fontSize: 13, color: Colors.amber),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    padding: const EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.amber),
                                    child: const Icon(Icons.search_outlined,
                                        size: 30, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 25,
                            foregroundImage: AssetImage('assets/photo.webp'),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'Good Morning',
                        style: TextStyle(
                            letterSpacing: 2.5,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Grab your first coffee in this morning',
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15, left: 10),
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // shrinkWrap: true,
                          itemCount: text.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                select(index);
                              },
                              child: Container(
                                  height: 25,
                                  width: width[index],
                                  margin:
                                      const EdgeInsets.only(right: 10, left: 5),
                                  decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? Colors.amber
                                          : Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      index == 0
                                          ? const Icon(
                                              Icons.filter_list,
                                              color: Colors.white,
                                            )
                                          : const SizedBox(height: 0, width: 0),
                                      index == 0
                                          ? const SizedBox(width: 5)
                                          : const SizedBox(width: 0),
                                      Text(
                                        text[index],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      child: CoffeeList(
                        image: image,
                        text: text2,
                        price: price,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Today\'s Deal',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                    ),
                    ListView.builder(
                        itemCount: images.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TodaysDeal(
                            images: images[index],
                            prices: prices[index],
                            reduced: reducedPrices[index],
                            name: name[index],
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomPages(
          icon: icon,
          bottomIcon: bottomIcon,
          bottomPage: bottomPage,
          text1: text1,
        ));
  }
}
