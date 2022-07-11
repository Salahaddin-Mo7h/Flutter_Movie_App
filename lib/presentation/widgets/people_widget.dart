import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/data/model/people_model.dart';

//Row Description Widget
class LargeImageListRowDetailsWidget extends StatelessWidget {
  final PeopleModel list;
  final ActorDetailsModel model;
  final IconData? fourthRowPrefixIcon;

  static final BoxShadow _cardShadow = BoxShadow(
    offset: Offset(2, 2),
    color: Colors.grey[300] ?? Colors.grey,
    blurRadius: 7.0,
    spreadRadius: 3.0,
  );

  const LargeImageListRowDetailsWidget({
    Key? key,
    required this.list,
    required this.model,
    this.fourthRowPrefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(0.0),
              bottomRight: Radius.circular(5.0),
            ),
            boxShadow: [_cardShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                list.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                list.knownForDepartment.toString(),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (fourthRowPrefixIcon != null)
                    Icon(
                      fourthRowPrefixIcon!,
                      color: Colors.grey[600],
                      size: 17.0,
                    ),
                  Flexible(
                    child: Text(
                      list.id.toString(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

//Image widget
class LargeImageListRowThumbnailImageWidget extends StatelessWidget {
  final PeopleModel list;
  final Color loadingIndicatorColor;

  const LargeImageListRowThumbnailImageWidget({
    Key? key,
    required this.list,
    required this.loadingIndicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: list.id!,
      child: Container(
        height: 220,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: list.profilePath == null
            ? Image.network(
                "https://cdn-icons.flaticon.com/png/512/4140/premium/4140037.png?token=exp=1657475325~hmac=b07732984c66dd78eecda7c20a1692f3",
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: "http://image.tmdb.org/t/p/w500/" + list.profilePath!,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(
                    child: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                        loadingIndicatorColor,
                      )),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
