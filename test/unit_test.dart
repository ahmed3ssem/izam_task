import 'package:flutter_test/flutter_test.dart';
import 'package:izam_task/presenter/login/login_presenter.dart';

void main() {
  LoginPresenter presenter = LoginPresenter();
  testWidgets('Empty email should return false', (WidgetTester tester) async {
    bool result = presenter.checkEmailAndPassword('', 'password');
    expect(result, false);
  });

  testWidgets('Invalid email should return false', (WidgetTester tester) async {
    bool result = presenter.checkEmailAndPassword('invalid_email', 'password');
    expect(result, false);
  });

  testWidgets('Empty password should return false', (WidgetTester tester) async {
    bool result = presenter.checkEmailAndPassword('email@example.com', '');
    expect(result, false);
  });

  testWidgets('Invalid password should return false', (WidgetTester tester) async {
    bool result = presenter.checkEmailAndPassword('email@example.com', 'invalid_password');
    expect(result, false);
  });

  testWidgets('Valid email and password should return true', (WidgetTester tester) async {
    bool result = presenter.checkEmailAndPassword('email@example.com', 'valid_password123!');
    expect(result, true);
  });
}