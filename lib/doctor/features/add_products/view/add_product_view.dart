import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/doctor/features/add_products/manager/add_product__cubit.dart';
import 'package:intelligent_pharmacy/shared/styles/colors.dart';

import '../../../../authentication/view/widgets/custom_text_form.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => AddProductCubit(),
  child: BlocConsumer<AddProductCubit, AddProductState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    AddProductCubit cubit = AddProductCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 50),
        child: SingleChildScrollView(
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
                child:
                    state is ProductImageLoading?
              const Center(
                child: CircularProgressIndicator(),
              )
              :
                Center(
                  child: cubit.imageUrl==null ? IconButton(onPressed: () {
                    cubit.imgFromGallery();
                  }, icon: const Icon(Icons.add),)
                      :Image.network(cubit.imageUrl!.toString())
                  ,
                ),
              ),
              CustomTextForm(
                controller:cubit.productNameCntroller,
                hintText: "Product Name",
                obscure: false,
                keyboardType: TextInputType.text,
              ),
              CustomTextForm(
                controller:cubit.productPriceCntroller,
                hintText: "Product Price",
                obscure: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30,),
              state is AddProductLoading?
             const  Center(
                child:
                CircularProgressIndicator(),
              )
                  :
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: MaterialButton(
                  onPressed: () async {
                    cubit.addProduct(
                        image: cubit.imageUrl.toString(), name: cubit.productNameCntroller.text, price: cubit.productPriceCntroller.text);
                  },
                  minWidth: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.13,
                  elevation: 3,
                  color: ColorsAsset.mainColor,
                  textColor: Colors.white,
                  child: const Text(
                    "Upload Product",
                    style: TextStyle(

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
),
);
  }
}
