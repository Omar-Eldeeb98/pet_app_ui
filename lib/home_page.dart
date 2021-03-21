import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'category_list.dart';
import 'data.dart';
import 'pet_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pet> pets = getPetList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
       // color: Colors.white,
        height: 50,
        buttonBackgroundColor: Colors.grey[900],
        backgroundColor: Colors.black,
        items: [
          Icon(
            Icons.home,
            color: Colors.orange,
            size: 35,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.orange,
            size: 35,
          ),
          Icon(
            Icons.call,
            color: Colors.orange,
            size: 35,
          ),
          Icon(
            Icons.settings,
            color: Colors.orange,
            size: 35,
          ),
          Icon(
            Icons.share_sharp,
            color: Colors.orange,
            size: 35,
          ),
          Icon(
            Icons.info_outlined,
            color: Colors.orange,
            size: 35,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.sort,
          color: Colors.grey[700],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.notifications_active,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    'PETS HOME',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.pets,
                    color: Colors.grey[700],
                    size: 40.0,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Text(
                'Find Your Pets',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  ),
                  filled: true,
                  fillColor: Colors.grey[900],
                  contentPadding: EdgeInsets.only(right: 30.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Icon(
                      Icons.search_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pets Categoty',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  Icon(
                    Icons.more_vert_outlined,
                    color: Colors.grey[700],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCategory(
                        Category.DOG,
                        "60",
                        Colors.red[200],
                      ),
                      buildCategory(
                        Category.BUNNY,
                        "150",
                        Colors.green[200],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCategory(
                        Category.HAMSTER,
                        "300",
                        Colors.orange[200],
                      ),
                      buildCategory(
                        Category.CAT,
                        "70",
                        Colors.blue[200],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Newest Pet",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        Icon(
                          Icons.more_vert_outlined,
                          color: Colors.grey[700],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 280,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: buildNewestPet(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vets Near You",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey[800],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    margin: EdgeInsets.only(bottom: 16),
                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        buildVet("assets/images/vets/vet_0.png",
                            "Animal Emergency Hospital", "(369) 133-8956"),
                        buildVet("assets/images/vets/vet_1.png",
                            "Artemis Veterinary Center", "(706) 722-9159"),
                        buildVet("assets/images/vets/vet_2.png",
                            "Big Lake Vet Hospital", "(598) 4986-9532"),
                        buildVet("assets/images/vets/vet_3.png",
                            "Veterinary Medical Center", "(33) 8974-559-555"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(Category category, String total, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryList(category: category)),
          );
        },
        child: Container(
          height: 80.0,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[500],
              width: 0.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/" +
                          (category == Category.HAMSTER
                              ? "hamster"
                              : category == Category.CAT
                                  ? "cat"
                                  : category == Category.BUNNY
                                      ? "bunny"
                                      : "dog") +
                          ".png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category == Category.HAMSTER
                        ? "Hamsters"
                        : category == Category.CAT
                            ? "Cats"
                            : category == Category.BUNNY
                                ? "Bunnies"
                                : "Dogs",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total of " + total,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNewestPet() {
    List<Widget> list = [];
    for (var i = 0; i < pets.length; i++) {
      if (pets[i].newest) {
        list.add(PetWidget(pet: pets[i], index: i));
      }
    }
    return list;
  }

  Widget buildVet(String imageUrl, String name, String phone) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          width: 0.0,
          color: Colors.grey[300],
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 98,
            width: 98,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.grey[800],
                    size: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  "OPEN - 24/7",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
