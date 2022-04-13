import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inshorts_app/model/activity_model.dart';
import 'package:inshorts_app/model/category_model.dart';
import 'package:inshorts_app/model/coin_model.dart';
import 'package:inshorts_app/model/notification_model.dart';
import 'package:inshorts_app/provider/category_data.dart';
import 'package:inshorts_app/views/setting_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<CategoryModel> categories = <CategoryModel>[];
  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ActivityModel> activityList = [
      ActivityModel(
          id: "1",
          imageUrl:
              "https://blog.arkieva.com/wp-content/uploads/2022/01/national-puzzle-day-2022.png"),
      ActivityModel(
          id: "2",
          imageUrl:
              "https://www.quoteswishesmsg.com/wp-content/uploads/2020/06/Quote-of-the-day.png"),
    ];

    List<CoinModel> coinsList = [
      CoinModel(
          id: "1",
          coinName: "BITCOIN",
          imageUrl:
              "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png",
          percentage: "0.2%",
          price: "₹ 36,77,878.31"),
      CoinModel(
          id: "1",
          coinName: "BITCOIN",
          imageUrl:
              "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png",
          percentage: "0.2%",
          price: "₹ 36,77,878.31"),
      CoinModel(
          id: "1",
          coinName: "BITCOIN",
          imageUrl:
              "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png",
          percentage: "0.2%",
          price: "₹ 36,77,878.31"),
      CoinModel(
          id: "1",
          coinName: "BITCOIN",
          imageUrl:
              "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png",
          percentage: "0.2%",
          price: "₹ 36,77,878.31"),
      CoinModel(
          id: "1",
          coinName: "BITCOIN",
          imageUrl:
              "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png",
          percentage: "0.2%",
          price: "₹ 36,77,878.31"),
    ];

    // List<CategoryModel> categoryList = [
    //   CategoryModel(
    //       id: "1",
    //       categoryName: "Automobile",
    //       assetsImage: "assets/images/automobile.png"),
    //   CategoryModel(
    //       id: "2",
    //       categoryName: "All News",
    //       assetsImage: "assets/images/all_news.png"),
    //   CategoryModel(
    //       id: "3",
    //       categoryName: "Trending",
    //       assetsImage: "assets/images/trending.png"),
    //   CategoryModel(
    //       id: "4",
    //       categoryName: "Bookmarks",
    //       assetsImage: "assets/images/bookmark.png"),
    //   CategoryModel(
    //       id: "5",
    //       categoryName: "Unread",
    //       assetsImage: "assets/images/unread.png"),
    //   CategoryModel(
    //       id: "6",
    //       categoryName: "Entertainment",
    //       assetsImage: "assets/images/entertainment.png"),
    // ];

    List<NotificationModel> notificationList = [
      NotificationModel(
          id: "1",
          imageUrl:
              "https://images.pexels.com/photos/269948/pexels-photo-269948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          title:
              'Which bank recorded the heighest\nvalue of fraud in 9 months as per\ngovt data?'),
      NotificationModel(
          id: "2",
          imageUrl:
              "https://images.pexels.com/photos/269948/pexels-photo-269948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          title:
              'Which bank recorded the heighest\nvalue of fraud in 9 months as per\ngovt data?'),
      NotificationModel(
          id: "3",
          imageUrl:
              "https://images.pexels.com/photos/269948/pexels-photo-269948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          title:
              'Which bank recorded the heighest\nvalue of fraud in 9 months as per\ngovt data?'),
      NotificationModel(
          id: "4",
          imageUrl:
              "https://images.pexels.com/photos/269948/pexels-photo-269948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          title:
              'Which bank recorded the heighest\nvalue of fraud in 9 months as per\ngovt data?'),
    ];

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 25,
        leading: Container(
            margin: const EdgeInsets.only(left: 15.0),
            width: 150,
            height: screenHeight,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
              icon: const Icon(
                Icons.settings,
                size: 18,
                color: Colors.blue,
              ),
            )),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: screenWidth,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Discover",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 30,
                        height: 3,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: const [
                Text(
                  "My Feed",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 18,
                ),
              ],
            ),
          )
        ],
        // centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: screenWidth * 10,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.blue,
                      size: 25,
                    ),
                    Text(
                      "Search for news",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth,
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: activityList.length,
                    itemBuilder: (context, index) {
                      return activityCard(activityList[index]);
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  "Coin Watch powered by CoinDCX",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth,
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: coinsList.length,
                    itemBuilder: (context, index) {
                      return coinDCXCard(coinsList[index]);
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth,
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return categorie(categories[index]);
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text("Notifications",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 55),
                          width: 30,
                          height: 2,
                          color: Colors.black,
                        )
                      ],
                    ),
                    Container(
                      child: const Text(
                        "VIEW ALL",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth,
                height: 300,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: notificationList.length,
                    itemBuilder: (context, index) {
                      return notification(notificationList[index]);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget notification(NotificationModel item) {
    return Container(
      // height: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Container(
                  width: 60,
                  height: 50,
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }

  Widget categorie(CategoryModel item) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 10),
                width: 60,
                height: 70,
                color: Colors.white,
                child: Image.asset(
                   ,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(item.categoryName,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  Widget coinDCXCard(CoinModel item) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      // height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.white,
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(item.coinName,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 10),
              child: Text(
                item.price,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, top: 5),
              child: Text(
                item.percentage,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget activityCard(ActivityModel item) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.5,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xfff00000029),
            blurRadius: 4.0,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}
