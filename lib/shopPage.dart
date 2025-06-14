import 'package:ecommerce_project/imports.dart';

class ProductService {
  static Future<List<shopPageProduct>> fetchProducts() async {
    final snapshot = await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs.map((doc) => shopPageProduct.fromFirestore(doc.data())).toList();
  }
}

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  List<shopPageProduct> allProducts = [];
  List<shopPageProduct> displayedProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    allProducts = await ProductService.fetchProducts();
    setState(() {
      displayedProducts = allProducts;
      isLoading = false;
    });
  }

  void updateSearch(String query) {
    final results = allProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      displayedProducts = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email ?? "Guest_Email";
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello $userEmail", style: appTextStyles.bodySmall),
                  Text("Good Morning!", style: appTextStyles.h3),
                ]
              )
            ),

            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())),
              child: Icon(Icons.shopping_bag_outlined, size: 30,)
            )
          ]
        ),

        shape: Border(
          bottom: BorderSide(color: Colors.grey[600]!)
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            customSearchBar(),

            //Products
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 0, bottom: 5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ), 
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  final product = displayedProducts[index];

                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth * 0.9
                      ),

                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600]!, width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        children: [
                          Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                  child: Image.asset(product.imagePath, width: double.infinity, fit: BoxFit.cover,),
                                ),
                              )
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name, 
                                  style: appTextStyles.withColor(
                                    appTextStyles.withWeight(
                                      appTextStyles.h3, FontWeight.bold
                                    ), 
                                  Theme.of(context).textTheme.bodyLarge!.color!),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth * 0.01,),

                                Text(
                                  product.category, 
                                  style: appTextStyles.withColor(
                                    appTextStyles.bodyMid,
                                    Colors.grey[600]!
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth * 0.01,),

                                Row(
                                  children: [
                                    Text(
                                      "PKR ${product.price}/-", 
                                      style: appTextStyles.withColor(
                                        appTextStyles.withWeight(
                                          appTextStyles.bodyLarge, FontWeight.bold
                                        ), 
                                        const Color.fromARGB(255, 16, 133, 35)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  );
                }
              )
            ),
          ]
        ),
      ),
    );
  }
}
