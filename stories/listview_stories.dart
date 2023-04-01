

import 'package:flutter/material.dart';
import 'package:monarch_stories/main.dart';

import 'test_data.dart';

Widget listviewLoading() => const MonarchListWidget(state: ListState.loading, list: itemList);

Widget listviewEmpty() => const MonarchListWidget(state: ListState.empty, list: itemList);

Widget listviewError() => const MonarchListWidget(state: ListState.error, list: itemList);

Widget listviewSuccess() => const MonarchListWidget(state: ListState.success, list: itemList);