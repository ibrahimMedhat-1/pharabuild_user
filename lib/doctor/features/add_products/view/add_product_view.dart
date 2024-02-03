import 'package:flutter/material.dart';

import '../../../../authentication/view/widgets/custom_text_form.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController productNameCntroller=TextEditingController();
    TextEditingController productPriceCntroller=TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: Center(
                child: IconButton(onPressed: (){},icon: Icon(Icons.add)),
              ),
            ),
            CustomTextForm(
              controller:productNameCntroller,
              hintText: "Product Name",
              obscure: false,
              keyboardType: TextInputType.text,
            ),
            CustomTextForm(
              controller:productPriceCntroller,
              hintText: "Product Price",
              obscure: false,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 30,),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () async {
                },
                minWidth: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.13,
                elevation: 3,
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text(
                  "Upload Product",
                  style: TextStyle(

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
