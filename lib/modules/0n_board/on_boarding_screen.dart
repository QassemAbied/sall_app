import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sall_app/modules/login/login_screen.dart';
import 'package:sall_app/network/local/cachehelper.dart';
//import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class onboarding
{
  String ? images;
  String ? text1;
  String ? text2;
  onboarding({
    this.images,
    this.text1,
    this.text2,
});

}
class namebuttom
{
  String? name;
  namebuttom({this.name});
}
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //const OnBoardingScreen({Key? key}) : super(key: key);
List<onboarding>onboardingscreen=
[
  onboarding(
    images: 'images/teaser.png',
    text1: 'Purchase your items online',
    text2: 'Natus error sit voluptayem accuasntium natus laudantium totam rem aperiam',
  ),
  onboarding(
    images: 'images/teaseres.png',
    text1: 'Choose in_Store pick_up',
    text2: 'Natus error sit voluptayem accuasntium natus laudantium totam rem aperiam',
  ),
  onboarding(
    images: 'images/teaseree.png',
    text1: 'Or Choose home delivery',
    text2: 'Natus error sit voluptayem accuasntium natus laudantium totam rem aperiam',
  ),
];
List<namebuttom>name=
[
  namebuttom(
    name: 'next',
  ),
  namebuttom(
    name: 'next',
  ),
  namebuttom(
    name: 'GoTo Start',
  ),
];

var onboardcontroller = PageController();
bool islast= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Welcome To Salla App'
          ),
        ),

      ),
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        onPageChanged: (int index)
        {
          if(index==onboardingscreen.length-1)
          {
            setState(() {
              islast = true;
            });
          }else
          {
            setState(() {
              islast=false;
            });
          }

        },
        controller:onboardcontroller ,
          itemBuilder: (context ,index)=>buildBoardingItems(onboardingscreen[index],name[index]),
              itemCount: onboardingscreen.length,
      ),
    );
  }

  Widget buildBoardingItems(onboarding? model , namebuttom? models)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image(
            image:AssetImage(
                model!.images!,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 327.0,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    model.text1!,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade500
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  model.text2!,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300,
                      color: Colors.amber.shade500
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    TextButton(
                        onPressed: (){
                          Submit();
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.deepPurple,
                          ),
                        ),
                    ),
                    Spacer(),
                    SmoothPageIndicator(
                        controller: onboardcontroller,
                        count: onboardingscreen.length,
                      effect: ExpandingDotsEffect(
                        spacing: 8.0,
                        dotWidth: 16.0,
                        dotHeight: 16.0,
                        dotColor: Colors.deepPurple,
                        activeDotColor: Colors.deepPurple,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: ()
                      {
                        if(islast)
                        {
                          Submit();
                        }else
                        {
                          onboardcontroller.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        models!.name!,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),
    ),
  );
  void Submit()=>
      CacheHelper.Savedata(
          key: 'onboarding',
          value:true,
      ).then((value) {
        if(value)
        {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=>LoginScreen(),
              ),
                  (route) => false
          );
        }
      }).catchError((error){
        print(error.toString());
      });


}
