import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/widgets/change_icon/change_icon_data.dart';
import 'package:ui_kit/widgets/change_icon/change_icon_type.dart';

void main() {
  test('returns the right icon name', () {
    const icon_enabled = ChangeIconData('wallet', ChangeIconType.enabled);
    expect('wallet_enabled.svg', icon_enabled.getIconPath());
    const icon_disabled = ChangeIconData('wallet', ChangeIconType.disabled);
    expect('wallet_disabled.svg', icon_disabled.getIconPath());
  });
}
