import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';

import 'src/services/database_service.dart';

@Component(
    selector: 'app-layout',
    directives: const [
      CORE_DIRECTIVES,
      DeferredContentDirective,
      MaterialButtonComponent,
      MaterialIconComponent,
      MaterialListComponent,
      MaterialListItemComponent,
      MaterialPersistentDrawerDirective,
      MaterialToggleComponent,
    ],
    providers: const [
      DatabaseService, 
      materialProviders,
    ],
    templateUrl: 'app_layout.html',
    styleUrls: const [
      'app_layout.css',
      'package:angular_components/app_layout/layout.scss.css',
    ])
class AppLayout {
  bool end = false;
  final DatabaseService dbService;
  AppLayout(DatabaseService this.dbService);
}