import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlpeshScreen extends StatefulWidget {
  const SlpeshScreen({super.key});

  @override
  State<SlpeshScreen> createState() => _SlpeshScreenState();
}

class _SlpeshScreenState extends State<SlpeshScreen> {
  @override
  Widget build(BuildContext context) {
    // var splace=Provider.of<SplaceProvider>(context,listen: false);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image(
              image: AssetImage("Assest/image/get-started.png"),
            ),
            Spacer(flex: 1,),
            FilledButton( onPressed: () async {
              // await splace.setfirsttime();
              Navigator.of(context).pushNamed("/home");
            }, child: Text("Get Started"),),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
