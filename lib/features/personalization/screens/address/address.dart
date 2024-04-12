import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/features/personalization/controllers/address_controller.dart';
import 'package:mobile_app/features/personalization/screens/address/widgets/single_address.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_addres.dart';

class UserAdressScreen extends StatelessWidget {
  const UserAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: obx(
            ()=> FutureBuilder(
              //use key to triger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
                //Helper function: handle loder,No record or error message
                final response = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;
            
                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.data!.length,
                  itemBuilder: (_, index) => TSingleAddress(
                    address: addresses[index],
                    onTap: () => controller.selectedAddress(addresses[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
