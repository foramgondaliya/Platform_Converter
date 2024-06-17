import 'package:platform_converter_app/views/Android_views/Componants/calls.dart';
import 'package:platform_converter_app/views/Android_views/Componants/chat.dart';
import 'package:platform_converter_app/views/Android_views/Componants/stories.dart';

List<Map<String, dynamic>> allData = [
  {
    'label': "Chats",
    'widget': Chats(),
  },
  {
    'label': "Calls",
    'widget': Calls(),
  },
  {
    'label': "Stories",
    'widget': Stories(),
  },
];
