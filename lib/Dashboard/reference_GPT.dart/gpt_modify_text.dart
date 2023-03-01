// import 'package:connector_openapi/api_client.dart';
// ignore_for_file: omit_local_variable_types, prefer_const_constructors, use_key_in_widget_constructors
import 'dart:html';

import 'package:core_openapi/api/applications_api.dart';
import 'package:core_openapi/api/assets_api.dart';
import 'package:core_openapi/api_client.dart';
import 'package:flutter/material.dart';
import 'package:runtime_client/particle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

import '../../Tab_Peoples_List/peoples_list.dart';
import '../../Tab_Plugins_and_More/plugins_and_more.dart';
import '../../Tab_DashBoard/checkbox_class.dart';
import '../../lists/relatedLists.dart';
import '../../statistics_singleton.dart';
import '../custom_classes.dart';

class GPTCustomAlertDialog extends StatefulWidget {
  final String initialText;

  GPTCustomAlertDialog({required this.initialText});

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<GPTCustomAlertDialog> {
  late TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 450,
        width: 450,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  autofocus: false,
                  style: TitleText(),
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    paste: true,
                    selectAll: true,
                  ),
                  cursorHeight: 12,
                  cursorColor: Colors.black,
                  minLines: 15,
                  maxLines: 15,
                  autocorrect: true,
                  controller: _textController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 24),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Need to make update before sending?',
                    hintStyle: TitleBlackText(),
                    suffixIcon: IconButton(
                      iconSize: 15,
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _descriptionController.clear();
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ParticleIconButton(icon: Icon(Icons.attach_file, color: Colors.black,), onPressed: (){},color: Colors.white,tooltip: 'add a file',),
                      ParticleIconButton(icon: Icon(Icons.image_outlined, color: Colors.black,), onPressed: (){},color: Colors.white,tooltip: 'add an image',),
                      ParticleIconButton(icon: Icon(Icons.link, color: Colors.black,), onPressed: (){},color: Colors.white,tooltip: 'add a link',),
                    ],
                  ),

                  SizedBox(height: 8),

                  /// bottom buttons
                  Row(
                    children: [


                      ///save button Teams
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'save',
                                style: ParticleFont.micro(
                                  context,
                                  customization: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                Navigator.of(context).pop;
                                Navigator.of(context).pop;

                                String port = '1000';
                                String host = 'http://localhost:$port';
                                final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));

                                final ApplicationsApi applicationsApi =
                                await ApplicationsApi(ApiClient(basePath: host));

                                Applications applicationsSnapshot =
                                await applicationsApi.applicationsSnapshot();

                                var first = applicationsSnapshot.iterable.first;

                                final Asset response = await assetsApi.assetsCreateNewAsset(
                                  seed: Seed(
                                    asset: SeededAsset(
                                      application: Application(
                                        privacy: first.privacy,
                                        name: first.name,
                                        onboarded: first.onboarded,
                                        platform: first.platform,
                                        version: first.version,
                                        id: first.id,
                                      ),
                                      format: SeededFormat(
                                        ///=======
                                        fragment: SeededFragment(
                                          string: TransferableString(
                                            raw: _textController.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    type: SeedTypeEnum.ASSET,
                                  ),
                                );
                                _textController.clear();

                              },
                            ),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'Share',
                                style: ParticleFont.micro(
                                  context,
                                  customization: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                Navigator.of(context).pop;
                                String port = '1000';
                                String host = 'http://localhost:$port';
                                final AssetsApi assetsApi = AssetsApi(ApiClient(basePath: host));

                                final ApplicationsApi applicationsApi =
                                await ApplicationsApi(ApiClient(basePath: host));

                                Applications applicationsSnapshot =
                                await applicationsApi.applicationsSnapshot();

                                var first = applicationsSnapshot.iterable.first;

                                final Asset response = await assetsApi.assetsCreateNewAsset(
                                  seed: Seed(
                                    asset: SeededAsset(
                                      application: Application(
                                        privacy: first.privacy,
                                        name: first.name,
                                        onboarded: first.onboarded,
                                        platform: first.platform,
                                        version: first.version,
                                        id: first.id,
                                      ),
                                      format: SeededFormat(
                                        ///=======
                                        fragment: SeededFragment(
                                          string: TransferableString(
                                            raw: _textController.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    type: SeedTypeEnum.ASSET,
                                  ),
                                );
                                _textController.clear();


                              },
                            ),
                          ),
                        ),
                      ),

                      ///close button Teams
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'close',
                                style: ParticleFont.micro(
                                  context,
                                  customization: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                _textController.clear();
                              },
                            ),
                          ),
                        ),
                      ),

                      /// reference button
                    ],
                  ),
                  // ///Description text field TODO Update description
                  // CustomDescriptionTextField(
                  //   controller: _textController,
                  //   onChanged: (String) {},
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

final TextEditingController _descriptionController = TextEditingController();
