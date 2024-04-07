import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              //2nd TextFormField
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Mobile Number',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              //3rd row
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.building_31),
                      labelText: 'Street',
                    ),
                  )),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.code),
                      labelText: 'Postal Code',
                    ),
                  )),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              //4th row
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.building),
                      labelText: 'City',
                    ),
                  )),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.activity),
                      labelText: 'State',
                    ),
                  )),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              //5th TextFormField
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: 'Country',
                ),
              ),
              const SizedBox(height: TSizes.defaultSpace),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('save'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
