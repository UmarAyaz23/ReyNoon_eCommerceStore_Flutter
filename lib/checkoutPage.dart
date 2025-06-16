import 'package:ecommerce_project/imports.dart';

class checkoutPage extends StatefulWidget {
  const checkoutPage({super.key});
  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _townController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Checkout", style: appTextStyles.h3),
        shape: Border(bottom: BorderSide(color: Colors.grey[600]!))
      ),

      body: Column(
        children: [
          // ListView inside Expanded to allow flexible scrolling
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final product = cart.cartItems[index];

                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[600]!, width: 1)),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(bottom: 10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(product.imagePath, height: screenWidth * 0.2),
                        ),
                      ),
                      SizedBox(width: 20),

                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: appTextStyles.h3),
                            Text(product.price.toString(), style: appTextStyles.bodyMid),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Subtotal section
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal: ", style: appTextStyles.withColor(appTextStyles.bodyLarge, Colors.grey[600]!)),
                SizedBox(width: 15),
                Text("PKR ${cart.calculateTotal().toString()}/-", style: appTextStyles.withColor(appTextStyles.h3, Colors.grey[600]!)),
              ],
            ),
          ),

          // Address and Place Order section — always stays at bottom
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address", style: appTextStyles.h3),
                SizedBox(height: 10),
                customTextField(label: "House No.", prefixIcon: Icons.house_outlined, keyboardType: TextInputType.name, isPassword: false, controller: _houseController,),
                SizedBox(height: 10),
                customTextField(label: "Street", prefixIcon: Icons.streetview_outlined, keyboardType: TextInputType.name, isPassword: false, controller: _streetController,),
                SizedBox(height: 10),
                customTextField(label: "Block", prefixIcon: Icons.rounded_corner_sharp, keyboardType: TextInputType.name, isPassword: false, controller: _blockController,),
                SizedBox(height: 10),
                customTextField(label: "Town (Gulshan, Johar, etc..)", prefixIcon: Icons.streetview_outlined, keyboardType: TextInputType.name, isPassword: false, controller: _townController),
                SizedBox(height: 10),
                customTextField(label: "City", prefixIcon: Icons.location_city_outlined, keyboardType: TextInputType.name, isPassword: false, controller: _cityController,),
                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_houseController.text.isNotEmpty && _streetController.text.isNotEmpty &&
                              _blockController.text.isNotEmpty && _townController.text.isNotEmpty && _cityController.text.isNotEmpty) {

                            Map<String, String> address = {
                              "house": _houseController.text,
                              "street": _streetController.text,
                              "block": _blockController.text,
                              "town": _townController.text,
                              "city": _cityController.text,
                            };

                            final firestoreService = FirestoreService();
                            await firestoreService.placeOrder(
                              products: cart.cartItems,
                              subtotal: cart.calculateTotal(),
                              address: address,
                            ); // clear cart after order placed

                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => orderConfirmPage(orderDetails: [
                                address["house"]!,
                                address["street"]!,
                                address["block"]!,
                                address["town"]!,
                                address["city"]!,
                              ]),
                            ));
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: white,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey[400]!, width: 1.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text("Place Order", style: appTextStyles.withColor(appTextStyles.h3, gold)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
