import 'package:flutter/material.dart';
import 'package:road_runner_driver/shared/shared.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class RequestedRide extends StatefulWidget {
  const RequestedRide({Key? key, required this.package}) : super(key: key);
  final PackageModel package;
  static Route route({required PackageModel package}) => MaterialPageRoute(
        builder: (_) => RequestedRide(package: package),
      );

  @override
  State<RequestedRide> createState() => _RequestedRideState();
}

class _RequestedRideState extends State<RequestedRide> {
  late BaseMapController mapController;

  bool isAccepted = false;
  bool hasArrived = false;
  bool hasDeliveryStarted = false;
  bool hasAllItemsDelivered = false;
  int currentDropOff = 1;

  @override
  void initState() {
    initializeMap();
    super.initState();
  }

  void initializeMap() {
    mapController = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
      areaLimit: BoundingBox(
        east: 10.4922941,
        north: 47.8084648,
        south: 45.817995,
        west: 5.9559113,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 30 + ScreenRatio.screenHeight / 2,
                  width: ScreenRatio.screenWidth,
                  child: OSMFlutter(
                    controller: mapController,
                    initZoom: 19,
                    trackMyPosition: false,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SafeArea(
                      child: AppIconButton(
                        icon: Icons.arrow_back,
                        onTap: () => context.pop(),
                        toolTip: 'Back',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            isAccepted == true
                ? hasArrived == false
                    ? SwipeableTile(
                        onSwiped: (SwipeDirection direction) {
                          setState(() {
                            hasArrived = true;
                          });
                        },
                        direction: SwipeDirection.startToEnd,
                        key: UniqueKey(),
                        backgroundBuilder: (BuildContext context,
                            SwipeDirection direction,
                            AnimationController progress) {
                          return Container(
                            color: AppColors.mintGreen,
                            child: Center(
                              child: Text(
                                'You have arrived pick-up',
                                style: TextStyle(
                                  fontSize: 16 * ScreenRatio.fontRatio,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.justGreen,
                                ),
                              ),
                            ),
                          );
                        },
                        color: AppColors.tangoOrange,
                        child: ListTile(
                          title: Text(
                            'Swipe left when you arrive',
                            style: TextStyle(
                              fontSize: 16 * ScreenRatio.fontRatio,
                              fontWeight: FontWeight.w500,
                              color: AppColors.solidOrange,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 70 * ScreenRatio.widthRatio,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.solidOrange,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.solidOrange,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.solidOrange,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(vertical: 15 * ScreenRatio.heightRatio),
                        color: hasDeliveryStarted == false ? AppColors.mintGreen : AppColors.fadedBlue,
                        child: Center(
                          child: Text(
                           hasDeliveryStarted == false ? 'You have arrived pick-up' : 'Enroute to drop-off $currentDropOff',
                            style: TextStyle(
                              fontSize: 16 * ScreenRatio.fontRatio,
                              fontWeight: FontWeight.w500,
                              color: hasDeliveryStarted == false ? AppColors.justGreen : AppColors.maeBlue,
                            ),
                          ),
                        ),
                      )
                : Container(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 13.0 * ScreenRatio.heightRatio,
                  vertical: 8.0 * ScreenRatio.heightRatio),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(radius: 27, backgroundImage: AssetImage('assets/images/person.png'),),
                      SizedBox(width: 3 * ScreenRatio.widthRatio),
                      Column(
                        children: [
                          const Text(
                            'Iyemadu Kathrina',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          isAccepted == true ? Container() :  SizedBox(height: 3 * ScreenRatio.heightRatio),
                         isAccepted == true ? Container() : AppTextChip(
                            '15mins away',
                            color: AppColors.maeBlue.withOpacity(0.2),
                            textColor: AppColors.maeBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                  isAccepted == true ? Container() :   const AppTextChip(
                    '₦5,000',
                    color: AppColors.mintGreen,
                    textColor: AppColors.justGreen,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60 + ScreenRatio.screenHeight / 4,
              width: ScreenRatio.screenWidth,
              child: SingleChildScrollView(
                child: AppOrderTimeLine(
                  dropOff: widget.package.dropOffs,
                  pickUpLocation: widget.package.pickUpLocation,
                ),
              ),
            ),
            SizedBox(
              height: 120 * ScreenRatio.heightRatio,
              child: isAccepted == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SecondaryButton(
                          context,
                          title: 'Reject',
                          height: 60 * ScreenRatio.heightRatio,
                          width: 150 * ScreenRatio.widthRatio,
                          color: AppColors.ashlyGrey,
                          onTap: (startLoading, stopLoading, btnState) {
                            context.pop();
                          },
                        ),
                        SecondaryButton(
                          context,
                          title: 'Accept',
                          height: 60 * ScreenRatio.heightRatio,
                          width: 150 * ScreenRatio.widthRatio,
                          color: AppColors.white,
                          bgColor: AppColors.solidOrange,
                          onTap: (startLoading, stopLoading, btnState) {
                            setState(() {
                              isAccepted = true;
                            });
                          },
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            AppIconButton2(icon: Icons.chat_bubble_outline),
                            AppIconButton2(icon: Icons.call_outlined),
                          ],
                        ),
                        SizedBox(height: 15.0 * ScreenRatio.heightRatio),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0 * ScreenRatio.pixelRatio),
                          child: hasArrived == false ? SecondaryButton(
                            context,
                            title: 'Cancel Ride',
                            height: 60 * ScreenRatio.heightRatio,
                            width: ScreenRatio.screenWidth,
                            color: AppColors.rageRed,
                            onTap: (startLoading, stopLoading, btnState) {
                              setState(() {
                                isAccepted = false;
                                context.pop();
                              });
                            },
                          ) :
                          SecondaryButton(
                            context,
                            title: hasDeliveryStarted == false ? 'Start Delivery' : 'Package Delivered',
                            height: 60 * ScreenRatio.heightRatio,
                            width: ScreenRatio.screenWidth,
                            bgColor: AppColors.solidOrange,
                            color: AppColors.white,
                            onTap: hasDeliveryStarted == false ? (startLoading, stopLoading, btnState){
                              setState(() {
                                hasDeliveryStarted = true;
                              });
                            } : (startLoading, stopLoading, btnState) {
                                if(currentDropOff < widget.package.dropOffs.length ){
                                  setState(() {
                                    currentDropOff ++;
                                  });
                                }
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
