import 'package:flutter_test/flutter_test.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/skip_like_ui_model.dart';
import 'package:skip_like_flutter/model/member.dart';

void main() {
  group('SkipLikeUiModelExtension', () {
    SkipLikeUiModel createHomeUIModel(List<Member> members) {
      return SkipLikeUiModel(
        members: members,
        isInAnimation: false,
        isIgnoreTouch: false,
        animationDuration: const Duration(),
        width: 0.0,
        height: 0.0,
        startDragX: 0.0,
        startDragY: 0.0,
        cardAppearance: CardAppearance(offsetX: 0.0, offsetY: 0.0, angle: 0.0),
        animationBeginCardAppearance: CardAppearance(
          offsetX: 0.0,
          offsetY: 0.0,
          angle: 0.0,
        ),
      );
    }

    test('visibleMembersは最大3件のメンバーを返す', () {
      final members = [
        Member(
          id: 1,
          age: 33,
          prefecture: '東京',
          imagePath: 'assets/member_01.png',
        ),
        Member(
          id: 2,
          age: 28,
          prefecture: '埼玉',
          imagePath: 'assets/member_02.png',
        ),
        Member(
          id: 3,
          age: 24,
          prefecture: '東京',
          imagePath: 'assets/member_03.png',
        ),
        Member(
          id: 4,
          age: 31,
          prefecture: '千葉',
          imagePath: 'assets/member_04.png',
        ),
      ];

      final uiModel = createHomeUIModel(members);

      final visibleMembers = uiModel.visibleMembers;
      expect(visibleMembers.length, 3);
      expect(visibleMembers[0], members[0]);
      expect(visibleMembers[1], members[1]);
      expect(visibleMembers[2], members[2]);
    });

    test('メンバーが3件未満の場合は全件返す', () {
      final members = [
        Member(
          id: 1,
          age: 33,
          prefecture: '東京',
          imagePath: 'assets/member_01.png',
        ),
        Member(
          id: 2,
          age: 28,
          prefecture: '埼玉',
          imagePath: 'assets/member_02.png',
        ),
      ];

      final uiModel = createHomeUIModel(members);

      final visibleMembers = uiModel.visibleMembers;
      expect(visibleMembers.length, 2);
      expect(visibleMembers[0], members[0]);
      expect(visibleMembers[1], members[1]);
    });

    test('メンバーが空の場合は空のリストを返す', () {
      final uiModel = createHomeUIModel([]);

      final visibleMembers = uiModel.visibleMembers;
      expect(visibleMembers, isEmpty);
    });
  });
}
