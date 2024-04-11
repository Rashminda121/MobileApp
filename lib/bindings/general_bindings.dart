import 'package:get/get.dart';

import '../features/shop/controllers/product/variation_controller.dart';


import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());

    Get.put(VariationController());
  }
}

  }
}

