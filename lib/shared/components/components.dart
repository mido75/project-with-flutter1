
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/shared/styles/color.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
     required this.iconName,
    required this.onPress,
    required this.text,
  }) : super(key: key);
  final String iconName;
  final String text;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0).w,
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconName,
              width: 20.0.w,
              height: 20.0.h,
            ),
            SizedBox(
              width: 15.0.w,
            ),
            Text(text,),
          ],
        ),

      ),
    );
  }
}

class AppAssets {
  /// Home Page Images
  static const String topBannerHomePageAsset =
      'https://cdn1.expertreviews.co.uk/sites/expertreviews/files/2019/08/best_online_clothes_shops.jpg';
  static const String tempProductAsset1 =
      'https://m.media-amazon.com/images/I/61-jBuhtgZL._UX569_.jpg';

  /// Shop Page Images
  /// Authentication Page Images
  static const facebookIcon = 'assets/facebook-svgrepo-com.svg';
  static const googleIcon = 'assets/google-plus-svgrepo-com.svg';

  /// Checkout Images
  static const mastercardIcon =
      'https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png';
}

class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onClick;
  MyPopupMenuItem({required this.child, required this.onClick})
      : super(child: child);
  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }
}

class MyPopupMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  @override
  void handleTap() {
    widget.onClick();
  }
}



















/*
Widget defaultButton({
  double wid = double.infinity,
  double r = 10.0,
  double height= 40.0,
  required String text,
  required Function function,
}) => Container(
  width: wid,
  decoration: BoxDecoration(
    color: Color(0xff0CC095),
    borderRadius: BorderRadius.circular(
      10.0,
    ),
  ),
  child: MaterialButton(
    onPressed: function,
    height: height,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
*/
/*
Widget defaultButton({
  double wid = double.infinity,
  double r = 10.0,
  double height= 40.0,
  @required String text,
  bool isUpper = true,
  Color back = Colors.blue,
  @required Function function,
}) =>
    Container(
      width: wid,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        height: height,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );


Widget defultTextButton({
  @required String text,
  @required Function function,
}) => TextButton(
  onPressed: function,
  child:Text(text.toUpperCase()),
);

Widget defaultButton2({
  double width = double.infinity,
  Color background = Colors.blue,
  double height = 45,
  @required VoidCallback function,
  @required String text,
  bool isUpperCase = true,
  Color textColor = Colors.white,
  double fontSize = 15.0,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        height: height,
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ),
    );

Widget defultButton1({
  @required double width,
  @required Color background,
  @required VoidCallback function,
}) =>
    Container(
      width: width,
      color: background,
      // width: double.infinity,
      //color: Colors.blue,
      child: MaterialButton(
        onPressed: function,
        height: 50.0,
        child: Text(
          'CALCULATE',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );



Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType textType,
  @required String labelText,
  //required String hintText,
  @required IconData prefix,
  IconData suffix,
  bool isPass = false,
  Function(String) onSubmit,
  Function(String) onChange,
  Function() onSuffixPress,
  Function() onTap,
  @required FormFieldValidator<String> validate,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        // hintText: hintText,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(
            suffix,
          ),
          onPressed: onSuffixPress,
        )
            : null,
      ),
      validator: validate,
      obscureText: isPass,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
    );
/*
Widget bulidTaskItem(Map model,context) =>  Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(

      children: [

        CircleAvatar(

          radius: 40.0,

          child: Text(

            '${model['time']}',

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                '${model['title']}',

                style: TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 18.0,

                ),

              ),

              Text(

                '${model['date']}',

                style: TextStyle(

                  color: Colors.grey,

                ),

              ),

            ],

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        IconButton(

          onPressed: (){

          //  AppCubit.get(context).updataData(status:'done', id: model['id'],);

          },

          icon: Icon(

            Icons.check_box,

            color: Colors.green,

          ),

        ),

        IconButton(

          onPressed: (){

           // AppCubit.get(context).updataData(status:'archive', id: model['id'],);

          },

          icon: Icon(

            Icons.archive,

            color: Colors.black54,

          ),

        ),



      ],

    ),

  ),
  onDismissed: (direction){
  //  AppCubit.get(context).deletData(id: model['id'],);
  },
);
*/
/*
Widget taskBulider({
  @required List<Map>tasks,
}) =>  ConditionalBuilder(
  condition: tasks.length > 0 ,
  builder: (context) => ListView.separated(
    itemBuilder: (context,index) => bulidTaskItem(tasks[index],context),
    separatorBuilder: (context,index) => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          'No Tasks Yet , please add some ',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
*/

Widget MyDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);
/*
Widget buildArticalItem(artical,context) => InkWell(
  onTap: ()
  {
    navigateTo(context, webViewScreen(artical['url'],));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children:

      [

        Container(

          height: 120.0,

          width: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image: NetworkImage('${artical['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:

              [

                Expanded(

                  child: Text(

                    '${artical['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${artical['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

*/
/*
Widget articalbuilder(list,context,{isSearch=false}) => ConditionalBuilder(
  condition: list.length>0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index) => buildArticalItem(list[index],context),
    separatorBuilder: (context,indes) => MyDivider(),
    itemCount: list.length,
  ),
  fallback: (context) => isSearch? Container():Center(child: CircularProgressIndicator()),
);

*/

void navigateTo(context,widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder:(context) => widget),
      (route)
  {
    return false;
  },
);

/*
void showToast(
    {@required String message,
      @required ToastStates state,
    }) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates {SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.ERROR:
      color=Colors.red;
      break;
    case ToastStates.SUCCESS:
      color=Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

*/

Widget buildListProduct(model,context,{bool oldPrice = true,})=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children:
          [
            Image(
              image: NetworkImage(model.image),
              width: 120.0,
              height: 120.0,
            ),
            if(model.discount != 0 && oldPrice)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,),
                color: Colors.red,
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                    fontSize: 9.0,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 1.1,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '${model.price.toString()}',
                    style: TextStyle(
                      fontSize: 12.0,
                    //  color: defualtColor,
                    ),
                  ),
                  SizedBox(
                    width: 0.5,
                  ),
                  if(model.discount!= 0  && oldPrice)
                    Text(
                      '${model.oldPrice.toString()}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: ()
                    {
                    //  ShopCubit.get(context).changeFavorites(model.id);
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                     // backgroundColor:ShopCubit.get(context).favorites[model.id] ? defualtColor : Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        size: 20.0,
                        color: Colors.white,
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

Widget defaultAppBar({
  @required BuildContext context,
  String title,
  List<Widget>actions,
}) => AppBar(
  leading: IconButton(
    onPressed: ()
    {
      Navigator.pop(context);
    },
    icon: Icon(
      //IconBroken.Arrow___Left_2,
      Icons.arrow_back_ios,
    ),
  ),
  title: Text(title,),
  titleSpacing: 5.0,
  actions: actions,
);

 */