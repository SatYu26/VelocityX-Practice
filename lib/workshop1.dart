import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.mdWindowSize);
    return Scaffold(
      backgroundColor: Vx.gray200,
      appBar: VxAppBar(
        searchBar: true,
        title: Text('VelocityX'),
      ),
      body: VStack([
        VxArc(
            height: 50,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.RIGHT,
            child: VxBox().size(context.screenWidth, 100).teal500.make()),
        'Now using VelocityX'
            .text
            .color(context.isMobile ? Vx.amber100 : Colors.black)
            .headline5(context)
            .bold
            .center
            .uppercase
            .make()
            .box
            .alignCenter
            // .size(300, 200)
            .sizePCT(context: context, widthPCT: 80, heightPCT: 25)
            .p16
            .roundedLg
            // .gradientFromTo(from: Vx.amber400, to: Vx.rose500)
            .radialGradient([Vx.amber400, Vx.rose500])
            // .shadow
            .outerShadowXl
            .white
            .makeCentered(),
        VxResponsive(
          xsmall: "i am extra small".text.xl5.make().box.p16.indigo200.make(),
          small: "i am Small".text.xl5.make().box.p16.indigo200.make(),
          medium: "i am medium".text.xl5.make().box.p16.indigo200.make(),
          large: "i am large".text.xl5.make().box.p16.indigo200.make(),
          fallback: "i am Fallback".text.xl5.make().box.p16.indigo200.make(),
          xlarge: "i am extra large".text.xl5.make().box.p16.indigo200.make(),
        ).p16(),
        VxCircle(
          backgroundColor: Vx.emerald500,
          radius: 150,
        ).clipHalf().p8(),
        VxCapsule(),
        VxTriangle(),
        VxTicket()
        // VxDevice(
        //     mobile: "i am mobile".text.xl5.make().box.p16.indigo200.make(),
        //     web: 'i am not mobile'.text.make()),
      ]).centered().scrollVertical(),
    );
  }
}
