import 'package:ecommerce_project/imports.dart';

class userOrderPage extends StatelessWidget {
  const userOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<fetchUserdetails>(context); // This is your UserProvider
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Your Orders", style: appTextStyles.h3),
        shape: Border(bottom: BorderSide(color: Colors.grey[600]!)),
      ),

      body: userDetails.isLoading
          ? Center(child: CircularProgressIndicator())
          : userDetails.userOrders.isEmpty
              ? Center(child: Text("No orders found.", style: appTextStyles.bodyLarge))
              : Padding(padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: userDetails.userOrders.length,
                  itemBuilder: (context, index) {
                    final order = userDetails.userOrders[index];
                    final products = order['products'] as List<dynamic>;

                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey[400]!)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ORDER ID & SUBTOTAL
                          Text("Order ID: ${order['orderID']}", style: appTextStyles.labelMid),
                          SizedBox(height: 5),
                          Text("Subtotal: PKR ${order['subtotal']}/-", style: appTextStyles.bodyMid),
                          Divider(thickness: 1, color: Colors.grey[400]),
                          SizedBox(height: 5),

                          // PRODUCTS INSIDE ORDER
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            itemBuilder: (context, productIndex) {
                              final product = products[productIndex];

                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        product['imagePath'],
                                        height: screenWidth * 0.2,
                                        width: screenWidth * 0.2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 15),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(product['name'], style: appTextStyles.h3),
                                          Text("PKR ${product['price']}", style: appTextStyles.bodyMid),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
    );
  }
}
