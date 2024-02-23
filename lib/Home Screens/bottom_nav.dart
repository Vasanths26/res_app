import 'package:flutter/material.dart';

class BottomPages extends StatelessWidget {
  const BottomPages(
      {super.key,
      required this.icon,
      required this.bottomIcon,
      required this.bottomPage,
      required this.text1});
  final List<IconData> icon;
  final Function(int index) bottomIcon;
  final int bottomPage;
  final List<String> text1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
          itemCount: icon.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    bottomIcon(index);
                  },
                  child: Container(
                    width: 70,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: bottomPage == index
                        ? Column(
                            children: [
                              Flexible(
                                child: Text(
                                  text1[index],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.amber),
                                ),
                              ),
                              const Flexible(
                                child: Text(
                                  '.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.w900),
                                ),
                              )
                            ],
                          )
                        : Icon(
                            icon[index],
                            size: 30,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
