import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrs_restaurant_app/widgets/scalling.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<int>> countsList = List.generate(10, (index) => List.filled(10, 0));
  int count = 1;
  int selectedIndex2 = -1;
  int selectedIndex = -1;
  int selectedIndex3 = -1;

  int? singleItemIndex;
  int? singleCatIndex;
  List<List<Map<String, dynamic>>> itemsList = [];
  List<List<Map<String, dynamic>>> itemsList2 = [];
  List<List<Map<String, dynamic>>> itemsList3 = [];

  List<ScrollController> itemControllers = [];

  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    itemsList = List.generate(menuItems.length, (index) => menuItems);
    itemControllers =
        List.generate(menuItems.length, (index) => ScrollController());
    selectedIndex = 0;
    // Set the first index as the default selected index

    itemsList2 = List.generate(menuItems2.length, (index2) => menuItems2);
    itemControllers =
        List.generate(menuItems2.length, (index2) => ScrollController());
    selectedIndex = 0;
    // Set the first index as the default selected index

    itemsList3 = List.generate(menuItems3.length, (index3) => menuItems3);
    itemControllers =
        List.generate(menuItems3.length, (index3) => ScrollController());
    selectedIndex = 0;
  }

  final List<Map<String, dynamic>> menuItems = [
    {'image': 'assets/image/fire.png', "text": 'POPULAR'},
    {'image': 'assets/image/starter.png', "text": 'STARTER'},
    {'image': 'assets/image/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/image/fast_food.png', "text": 'FAST FOOD'},
    {'image': 'assets/image/beverages.png', "text": 'BEVERAGES'},
    {'image': 'assets/image/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/image/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/image/fast_food.png', "text": 'FAST FOOD'},
    {'image': 'assets/image/beverages.png', "text": 'BEVERAGES'},
    {'image': 'assets/image/dessert.png', "text": 'DESSERT'},
  ];

  final List<Map<String, dynamic>> menuItems2 = [
    {'image': 'assets/images/dine_In.png', "text": 'Dine In'},
    {'image': 'assets/images/pick_up.png', "text": 'Pick Up'},
    {'image': 'assets/images/delivery.png', "text": 'Delivery'},
    {'image': 'assets/images/order.png', "text": 'Order'},
    {'image': 'assets/images/reset.png', "text": 'Reset'},
    // {'image': 'assets/images/reload.png', "text": 'Reload'},
    {'image': 'assets/images/note.png', "text": 'Note'},
    {'image': 'assets/images/split.png', "text": 'Split'},
    {'image': 'assets/images/payment.png', "text": 'Payment'},
    {'image': 'assets/images/submit.png', "text": 'Submit'},
  ];

  final List<Map<String, dynamic>> menuItems3 = [
    {'image': 'assets/images/dashboard.png', "text": 'Dashboard'},
    {'image': 'assets/images/pos.png', "text": 'POS'},
    {'image': 'assets/images/kitchen.png', "text": 'Kitchen'},
    {'image': 'assets/images/register.png', "text": 'Register'},
    {'image': 'assets/images/order_history.png', "text": 'Order History'},
  ];

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    MediaQuery.of(context).size.height;
    print(
        'height ${MediaQuery.of(context).size.height}, width ${MediaQuery.of(context).size.width}');
    init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    // width: MediaQuery.of(context).size.width / 2,
                    height: height(72),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: menuItems2.length,
                        itemBuilder: (context, index2) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex2 = index2;
                              });
                            },
                            child: Container(
                              width: width(65),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index2 == selectedIndex2
                                    ? Colors.green
                                    : Colors.blue[50],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    menuItems2[index2]['image'],
                                    scale: 15,
                                  ),
                                  Text(
                                    menuItems2[index2]['text'],
                                    style: GoogleFonts.getFont('Poppins',
                                        color: index2 == selectedIndex2
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 5,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[50],
                  width: width(2),
                  height: height(60),
                ),
                Container(
                  color: Colors.white,
                  width: width(450),
                  // width: MediaQuery.of(context).size.width / 2,
                  height: height(72),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, top: 5, bottom: 5, right: 5),
                    child: ListView.separated(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: menuItems3.length,
                      itemBuilder: (context, index3) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex3 = index3;
                            });
                          },
                          child: Container(
                            width: width(80),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index3 == selectedIndex3
                                  ? Colors.green
                                  : Colors.blue[50],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  menuItems3[index3]['image'],
                                  scale: 15,
                                ),
                                Text(
                                  menuItems3[index3]['text'],
                                  style: GoogleFonts.getFont('Poppins',
                                      color: index3 == selectedIndex3
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 5,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: const Color(0xffD4D4D4),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                height: height(50),
                                width: width(435),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                            mainAxisExtent: 50),
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return const Row(
                                        children: [
                                          Text('Dine In'),
                                          Icon(
                                            Icons.edit_square,
                                            size: 22,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: height(50),
                                width: width(435),
                                color: Colors.white70,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width(8)),
                                  child: const Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text('Food Item'),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('Quantity'),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Price',
                                          textAlign: TextAlign.right,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  height: height(277.8),
                                  width: width(435),
                                  // color: Colors.red,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        color: Colors.white60,
                                        child: const Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  top: 5,
                                                  bottom: 5,
                                                  right: 5),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                        'Extra Cheese Pizza'),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text('1'),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '\$ 5:00',
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height(55),
                            width: width(435),
                            color: const Color(0xffF7F7F7),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Container(
                                    height: height(40),
                                    width: width(40),
                                    color: Colors.green,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Container(
                                    height: height(40),
                                    width: width(40),
                                    color: Colors.green,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Container(
                                    height: height(40),
                                    width: width(40),
                                    color: Colors.red,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height(40),
                                  width: width(110),
                                  color: Colors.black,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        ' Modifiers',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: height(45),
                                width: width(145),
                                color: const Color(0xffFFFFFF),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('Sub Total'), Text('\$0.00')],
                                ),
                              ),
                              const VerticalDivider(
                                width: 0.3,
                                color: Colors.black,
                              ),
                              Container(
                                height: height(45),
                                width: width(145),
                                color: const Color(0xffFFFFFF),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Discount'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('0 % '),
                                        Icon(
                                          Icons.edit_square,
                                          size: 16,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                width: 0.3,
                                color: Colors.black,
                              ),
                              Container(
                                height: height(45),
                                width: width(145),
                                color: const Color(0xffFFFFFF),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Charge'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('\$0 '),
                                        Icon(
                                          Icons.edit_square,
                                          size: 16,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            height: 0.3,
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Container(
                                height: height(50),
                                width: width(145),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                    )),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Tax'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('5 % '),
                                        Icon(
                                          Icons.edit_square,
                                          size: 16,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                width: 0.3,
                                color: Colors.black,
                              ),
                              Container(
                                height: height(50),
                                width: width(290),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10))),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text(' Total'), Text('\$0.00')],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height(100),
                                // width: width(600),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: menuItems.length,
                                  itemBuilder: (context, int index) {
                                    if (index == menuItems.length - 1) {
                                      return const Padding(
                                        padding: EdgeInsets.only(right: 8),
                                      );
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                        controller.animateToPage(index,
                                            duration: const Duration(
                                                milliseconds: 700),
                                            curve: Curves
                                                .easeInOutCubicEmphasized);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                //                                          boxShadow: [
                                                //   BoxShadow(
                                                //       color: Color(0xffA22447).withOpacity(.05),
                                                //       // offset: Offset(0, 0),
                                                //       // blurRadius: 20,
                                                //       // spreadRadius: 33
                                                //       )
                                                // ],
                                                color: index == selectedIndex
                                                    ? Colors.green
                                                    : Colors.blue[50],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              width: width(90),
                                              // height: height(40),
                                              child: ListTile(
                                                title: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Image.asset(
                                                    menuItems[index]['image'],
                                                    // fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  menuItems[index]['text'],
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.getFont(
                                                      'Poppins',
                                                      color:
                                                          index == selectedIndex
                                                              ? Colors.white
                                                              : Colors.black,
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 50, // Increase the height to 50
                                      child: TextFormField(
                                        style: GoogleFonts.getFont('Poppins',
                                            color: Colors.black),
                                        // textAlign: TextAlign.center, // This property is not used here because it's already set to Center due to the Padding widget
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          // border: InputBorder.none, // This property is not used here because it's already set to none due to the Padding widget
                                          hintText: 'Search by food name',
                                          hintStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: PageView.builder(
                                  controller: controller,
                                  itemCount: menuItems.length,
                                  onPageChanged: (index) {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, itemIndex) {
                                        bool isSelected =
                                            singleItemIndex == itemIndex &&
                                                singleCatIndex == index;

                                        return Card(
                                          shadowColor: Colors.lightBlue,
                                          elevation: 3,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isSelected) {
                                                  // If already selected, toggle visibility
                                                  singleItemIndex = null;
                                                  singleCatIndex = null;
                                                } else {
                                                  // Otherwise, select the item
                                                  singleItemIndex = itemIndex;
                                                  singleCatIndex = index;
                                                }
                                              });
                                            },
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  'assets/image/pizza4.png',
                                                  scale: 5,
                                                  width: double.infinity,
                                                  //  fit: BoxFit.fill,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                          '\$5',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Poppins',
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.7),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 95,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5.0),
                                                      child: Text(
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        'Extra Cheese Pizza',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (isSelected ||
                                                    countsList[index]
                                                            [itemIndex] >
                                                        0)
                                                  if (isSelected ||
                                                      countsList[index]
                                                              [itemIndex] >
                                                          0)
                                                    Positioned(
                                                      bottom: 10,
                                                      left: 25,
                                                      right: 25,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          IconButton(
                                                            icon: const Icon(
                                                                Icons.remove),
                                                            onPressed: () {
                                                              setState(() {
                                                                if (countsList[
                                                                            index]
                                                                        [
                                                                        itemIndex] >
                                                                    0) {
                                                                  countsList[
                                                                          index]
                                                                      [
                                                                      itemIndex]--;
                                                                }
                                                              });
                                                            },
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
