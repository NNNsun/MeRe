import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'dart:io';
import '../widget/star_buttons.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int stars = 0;

    return DefaultLayout(
      leading: true,
      title: "리뷰작성",
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                height: height * 0.25,
                width: width,
                // 네트워크로 변경
                child: Image.asset(
                  "asset/temp/home_img/cafe_data_img/cafe_main/cafe12.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: height * 0.25,
                color: const Color.fromARGB(255, 39, 39, 39).withOpacity(0.6),
              ),
              Column(
                children: [
                  const Text(
                    "PLFL, 어땠나요?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  StarButtons(
                    onIndexChanged: (count) {
                      stars = count + 1;
                      print("별점: $stars점");
                    },
                  ),
                ],
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "사진을 올려주세요",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      Text(
                        "  (선택)",
                        style: TextStyle(color: IMPACT_COLOR_GRAY),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        // 사진 업로드 버튼
                        GestureDetector(
                          onTap: () {},
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(6),
                            dashPattern: const [4, 4],
                            color: IMPACT_COLOR_LIGHT_GRAY,
                            strokeWidth: 2,
                            child: SizedBox(
                              height: height * 0.115,
                              width: height * 0.115,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(photo_icon),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "2/5",
                                        style: TextStyle(
                                            color: IMPACT_COLOR_GRAY,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // 사진 리스트
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Stack(children: [
                            SizedBox(
                              height: height * 0.12,
                              width: height * 0.12,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "asset/temp/home_img/cafe_data_img/cafe_menu/menu_13.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                child: IconButton(
                                  padding: const EdgeInsets.all(5),
                                  constraints: const BoxConstraints(),
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    photo_delete_btn,
                                  ),
                                ))
                          ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: ImageUploader(),
          )
        ],
      ),
    );
  }
}

class ImageUploader extends StatefulWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles;

  Future<void> _pickImages() async {
    final List<XFile> pickedImages = [];

    setState(() {
      _imageFiles ??= [];
      _imageFiles!.addAll(pickedImages);
    });
  }

  void _deleteImage(int index) {
    setState(() {
      _imageFiles!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _imageFiles?.length == 5 ? null : _pickImages,
          child: const Text('이미지 선택'),
        ),
        if (_imageFiles != null && _imageFiles!.isNotEmpty)
          Column(
            children: [
              const SizedBox(height: 16.0),
              Text('선택된 이미지: ${_imageFiles!.length} 개'),
              const SizedBox(height: 16.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _imageFiles!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Image.file(
                        File(_imageFiles![index].path),
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: GestureDetector(
                          onTap: () => _deleteImage(index),
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
      ],
    );
  }
}
