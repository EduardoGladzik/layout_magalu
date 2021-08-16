import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_magalu/models/product.dart';
import 'package:layout_magalu/provider/products.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.jpg"),
        title: Text("Ofertas do dia"),
        bottom: PreferredSize(
          preferredSize: Size(2,2),
          child: Image.asset("assets/images/linha.jpg"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            Product product = products.elementAt(index);

            return ListTile(
              trailing: IconButton(
                icon: (product.isFavorite)
                  ? Icon(Icons.favorite) 
                  : Icon(Icons.favorite_outline)
                , 
                color: Colors.pink,
                onPressed: () {
                  setState(() {
                    product.isFavorite = !product.isFavorite;
                  });
                },
              ),
              title: Row(                
                children: [
                  Image.asset(
                    product.image,
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  )
                  ,
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 14,
                            )
                          ),
                          SizedBox(height: 3),
                          Text(
                            product.details,
                            style: TextStyle(
                              fontSize: 10
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "R\$${product.price}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "${product.installmentsNumber}x de R\$ ${product.installments} sem juros",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                ],   
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: products.length,
        ),
      ),
    );   
  }
}