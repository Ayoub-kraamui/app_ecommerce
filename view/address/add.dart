import 'package:app_ecommerce/controller/address/add_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdressAdd extends StatelessWidget {
  const AdressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Adress"),
        ),
        body: Container(child: GetBuilder<AddAddressController>(
          builder: (controllerpage) {
            return HandlingDataView(
              statusRequest: controllerpage.statusRequest,
              widget: Column(
                children: [
                  if (controllerpage.kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            markers: controllerpage.markers.toSet(),
                            onTap: (latloong) {
                              controllerpage.addMarkers(latloong);
                            },
                            initialCameraPosition: controllerpage.kGooglePlex!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controllerpage.completercontroller!
                                  .complete(controllermap);
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                                child: MaterialButton(
                              minWidth: 200,
                              onPressed: () {
                                controllerpage.goToPageAddDetailAddress();
                              },
                              child: Text(
                                "اكمل",
                                style: TextStyle(fontSize: 18),
                              ),
                              color: AppColor.primaryColor,
                              textColor: Colors.white,
                            )),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            );
          },
        )));
  }
}
