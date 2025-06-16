import 'package:ecommerce_project/imports.dart';

class orderConfirmPage extends StatefulWidget {
  final List<String> orderDetails;
  const orderConfirmPage({super.key, required this.orderDetails});

  @override
  State<orderConfirmPage> createState() => _orderConfirmPageState();
}

class _orderConfirmPageState extends State<orderConfirmPage>{
  @override
  Widget build(BuildContext context) {
    Provider.of<fetchUserdetails>(context, listen: false).fetchUserData();
    final cart = Provider.of<CartController>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            cart.clearCart();
            Navigator.pop(context);
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Order Confirmed!", style: appTextStyles.h3),
        shape: Border(bottom: BorderSide(color: Colors.grey[600]!))
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Address Section
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Delivery Address", style: appTextStyles.h3),
                SizedBox(height: 10),
                Text("House No: ${widget.orderDetails[0]}", style: appTextStyles.bodyMid),
                Text("Street: ${widget.orderDetails[1]}", style: appTextStyles.bodyMid),
                Text("Block: ${widget.orderDetails[2]}", style: appTextStyles.bodyMid),
                Text("Town: ${widget.orderDetails[3]}", style: appTextStyles.bodyMid),
                Text("City: ${widget.orderDetails[4]}", style: appTextStyles.bodyMid),
              ],
            ),
          ),

          Divider(),

          // Product List Section
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
                            Text("PKR ${product.price}", style: appTextStyles.bodyMid),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Subtotal Section
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal: ", style: appTextStyles.withColor(appTextStyles.bodyLarge, Colors.grey[600]!)),
                SizedBox(width: 15),
                Text("PKR ${cart.calculateTotal()}/-", style: appTextStyles.withColor(appTextStyles.h3, Colors.grey[600]!)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
