import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/card_appearance.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/skip_like_ui_model.dart';
import 'package:skip_like_flutter/screen/skip_like/state_holder/skip_like_ui_model_notifier.dart';
import 'package:skip_like_flutter/model/member.dart';

void main() {
  group('SkipLikeUiModelNotifier', () {
    late ProviderContainer container;
    late SkipLikeUiModelNotifier notifier;

    // テストで使用する共通のメンバーリスト
    final testMembers = [
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

    setUp(() {
      container = ProviderContainer();
      notifier = container.read(skipLikeUiModelNotifierProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態が正しく設定されている', () {
      final state = container.read(skipLikeUiModelNotifierProvider);
      expect(
        state,
        equals(
          SkipLikeUiModel(
            members: testMembers,
            isInAnimation: false,
            animationDuration: const Duration(),
            width: 0.0,
            height: 0.0,
            startDragX: 0.0,
            startDragY: 0.0,
            cardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: 0.0,
              angle: 0.0,
            ),
            animationBeginCardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: 0.0,
              angle: 0.0,
            ),
          ),
        ),
      );
    });

    test('visibleMembersは最大3件のメンバーを返す', () {
      final uiModel = SkipLikeUiModel(
        animationDuration: const Duration(),
        members: testMembers,
        isInAnimation: false,
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

      final visibleMembers = uiModel.visibleMembers;
      expect(visibleMembers.length, 3);
      expect(visibleMembers[0], testMembers[0]);
      expect(visibleMembers[1], testMembers[1]);
      expect(visibleMembers[2], testMembers[2]);
    });

    test('onPanStartでドラッグ開始位置とサイズが正しく設定される', () {
      notifier.onPanStart(
        width: 300.0,
        height: 500.0,
        startDragX: 150.0,
        startDragY: 250.0,
      );

      final state = container.read(skipLikeUiModelNotifierProvider);
      expect(
        state,
        equals(
          SkipLikeUiModel(
            members: testMembers,
            isInAnimation: false,
            animationDuration: const Duration(),
            width: 300.0,
            height: 500.0,
            startDragX: 150.0,
            startDragY: 250.0,
            cardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: 0.0,
              angle: 0.0,
            ),
            animationBeginCardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: 0.0,
              angle: 0.0,
            ),
          ),
        ),
      );
    });

    test('onPanUpdateでカードの位置と角度が正しく更新される', () {
      // ドラッグ開始位置を設定
      notifier.onPanStart(
        width: 300.0,
        height: 500.0,
        startDragX: 150.0,
        startDragY: 250.0,
      );

      // ドラッグ移動
      notifier.onPanUpdate(dragX: 200.0, dragY: 300.0);

      final expectedAngle = atan2(200.0 - 150.0, 500.0);
      final expectedOffsetY = 300.0 - 250.0;

      final state = container.read(skipLikeUiModelNotifierProvider);
      expect(
        state,
        equals(
          SkipLikeUiModel(
            members: testMembers,
            isInAnimation: false,
            animationDuration: const Duration(),
            width: 300.0,
            height: 500.0,
            startDragX: 150.0,
            startDragY: 250.0,
            cardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: expectedOffsetY,
              angle: expectedAngle,
            ),
            animationBeginCardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: 0.0,
              angle: 0.0,
            ),
          ),
        ),
      );
    });

    test('onPanEndでアニメーション状態が正しく設定される', () {
      // ドラッグ開始位置を設定
      notifier.onPanStart(
        width: 300.0,
        height: 500.0,
        startDragX: 150.0,
        startDragY: 250.0,
      );

      // ドラッグ移動
      notifier.onPanUpdate(dragX: 200.0, dragY: 300.0);

      final expectedAngle = atan2(200.0 - 150.0, 500.0);
      final expectedOffsetY = 300.0 - 250.0;

      // ドラッグ終了
      notifier.onPanEnd();

      final state = container.read(skipLikeUiModelNotifierProvider);
      expect(
        state,
        equals(
          SkipLikeUiModel(
            members: testMembers,
            isInAnimation: true,
            animationDuration: const Duration(milliseconds: 200),
            width: 300.0,
            height: 500.0,
            startDragX: 150.0,
            startDragY: 250.0,
            cardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: 0.0,
              angle: 0.0,
            ),
            animationBeginCardAppearance: CardAppearance(
              offsetX: 0.0,
              offsetY: expectedOffsetY,
              angle: expectedAngle,
            ),
          ),
        ),
      );
    });

    test('連続したドラッグ操作でカードの状態が正しく更新される', () {
      // 1. ドラッグ開始
      notifier.onPanStart(
        width: 300.0,
        height: 500.0,
        startDragX: 150.0,
        startDragY: 250.0,
      );

      // 2. 右上にドラッグ
      notifier.onPanUpdate(dragX: 200.0, dragY: 200.0);
      final state1 = container.read(skipLikeUiModelNotifierProvider);
      expect(state1.cardAppearance.offsetY, -50.0);
      expect(state1.cardAppearance.angle, atan2(50.0, 500.0));

      // 3. さらに右上にドラッグ
      notifier.onPanUpdate(dragX: 250.0, dragY: 150.0);
      final state2 = container.read(skipLikeUiModelNotifierProvider);
      expect(state2.cardAppearance.offsetY, -100.0);
      expect(state2.cardAppearance.angle, atan2(100.0, 500.0));

      // 4. ドラッグ終了
      notifier.onPanEnd();
      final finalState = container.read(skipLikeUiModelNotifierProvider);
      expect(finalState.isInAnimation, true);
      expect(finalState.animationDuration, const Duration(milliseconds: 200));
      expect(finalState.cardAppearance.offsetY, 0.0);
      expect(finalState.cardAppearance.angle, 0.0);
      expect(finalState.animationBeginCardAppearance.offsetY, -100.0);
      expect(
        finalState.animationBeginCardAppearance.angle,
        atan2(100.0, 500.0),
      );
    });

    test('onTapSkipとonAnimationEndでカードが正しくスキップされる', () {
      // 1. スキップボタンをタップ
      notifier.onTapSkip(width: 300.0, height: 500.0);
      final skipState = container.read(skipLikeUiModelNotifierProvider);
      expect(skipState.isInAnimation, true);
      expect(skipState.animationDuration, const Duration(milliseconds: 500));
      expect(skipState.cardAppearance.offsetX, -300.0);
      expect(skipState.cardAppearance.offsetY, 500.0);
      expect(skipState.animationBeginCardAppearance.offsetX, 0.0);
      expect(skipState.animationBeginCardAppearance.offsetY, 0.0);

      // 2. アニメーション終了
      notifier.onAnimationEnd();
      final finalState = container.read(skipLikeUiModelNotifierProvider);
      expect(finalState.isInAnimation, false);
      expect(finalState.cardAppearance.offsetX, 0.0);
      expect(finalState.cardAppearance.offsetY, 0.0);
      expect(finalState.animationBeginCardAppearance.offsetX, 0.0);
      expect(finalState.animationBeginCardAppearance.offsetY, 0.0);
      expect(finalState.members.length, testMembers.length - 1);
      expect(finalState.members[0], testMembers[1]);
    });

    test('onTapLikeとonAnimationEndでカードが正しくいいねされる', () {
      // 1. いいねボタンをタップ
      notifier.onTapLike(width: 300.0, height: 500.0);
      final likeState = container.read(skipLikeUiModelNotifierProvider);
      expect(likeState.isInAnimation, true);
      expect(likeState.animationDuration, const Duration(milliseconds: 500));
      expect(likeState.cardAppearance.offsetX, 300.0);
      expect(likeState.cardAppearance.offsetY, 500.0);
      expect(likeState.animationBeginCardAppearance.offsetX, 0.0);
      expect(likeState.animationBeginCardAppearance.offsetY, 0.0);

      // 2. アニメーション終了
      notifier.onAnimationEnd();
      final finalState = container.read(skipLikeUiModelNotifierProvider);
      expect(finalState.isInAnimation, false);
      expect(finalState.cardAppearance.offsetX, 0.0);
      expect(finalState.cardAppearance.offsetY, 0.0);
      expect(finalState.animationBeginCardAppearance.offsetX, 0.0);
      expect(finalState.animationBeginCardAppearance.offsetY, 0.0);
      expect(finalState.members.length, testMembers.length - 1);
      expect(finalState.members[0], testMembers[1]);
    });

    test('onResetPressedでメンバーリストが初期状態に戻る', () {
      // 1. スキップボタンをタップ
      notifier.onTapSkip(width: 300.0, height: 500.0);
      notifier.onAnimationEnd();
      final state1 = container.read(skipLikeUiModelNotifierProvider);
      expect(state1.members.length, testMembers.length - 1);
      expect(state1.members[0], testMembers[1]);

      // 2. いいねボタンをタップ
      notifier.onTapLike(width: 300.0, height: 500.0);
      notifier.onAnimationEnd();
      final state2 = container.read(skipLikeUiModelNotifierProvider);
      expect(state2.members.length, testMembers.length - 2);
      expect(state2.members[0], testMembers[2]);

      // 3. リセットボタンをタップ
      notifier.onResetPressed();
      final state3 = container.read(skipLikeUiModelNotifierProvider);
      expect(state3.members.length, testMembers.length);
      expect(state3.members, testMembers);
    });
  });
}
