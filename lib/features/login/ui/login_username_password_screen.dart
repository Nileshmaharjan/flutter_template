import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/features/login/bloc/bloc.dart';
import 'package:sample/res/index.dart';
import 'package:sample/features/login/ui/widgets/login_button.dart';
import 'package:sample/ui/widgets/common/background.dart';
import 'package:sample/ui/widgets/common/loading_dialog.dart';
import 'package:sample/utils/utils.dart';

class LoginWithUsernamePasswordScreen extends StatefulWidget {
  LoginWithUsernamePasswordScreen({Key key}) : super(key: key);

  @override
  _LoginWithUsernamePasswordScreenState createState() =>
      _LoginWithUsernamePasswordScreenState();
}

class _LoginWithUsernamePasswordScreenState
    extends State<LoginWithUsernamePasswordScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void doLogin(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      LoadingDialog.open(context);
      _authenticationBloc.add(LoginWithUsernamePassword(
          _usernameController.text, _passwordController.text));
    } else {
      displayMessage(context, UIStrings.emptyUserNameOrPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    final PreferredSizeWidget _appBar = PreferredSize(
      preferredSize: Size.fromHeight(56.h),
      child: Container(
        alignment: FractionalOffset.center,
        child: Text(
          'Login',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white,
                fontSize: 22.sp,
              ),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        const GradientBackground(),
        SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: _appBar,
              body: BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                if (state is AuthenticationFailed) {
                  displayMessage(context, UIStrings.failedToLogin);
                  LoadingDialog.cancel(context);
                }

                if (state is AuthenticationAuthenticated) {
                  LoadingDialog.cancel(context);
                  displayMessage(context, UIStrings.loginSuccess);
                }
              }, child: Builder(builder: (builderContext) {
                return SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        100.h -
                        MediaQuery.of(context).padding.top,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Container(),
                        ),
                        Form(
                          child: Column(
                            children: [
                              Text(
                                UIStrings.loginToEbpearls,
                                style: theme.textTheme.bodyText1.copyWith(
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              emailTextField(theme),
                              SizedBox(
                                height: 10.h,
                              ),
                              passwordTextField(theme),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        LoginButton(UIStrings.logIn,
                            key: Key('login-button'),
                            onPressed: () => doLogin(
                                  builderContext,
                                )),
                      ],
                    ),
                  ),
                );
              }))),
        )
      ],
    );
  }

  Widget emailTextField(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(3.0))),
      child: TextFormField(
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        key: Key('username-text-field-key'),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            isDense: true,
            labelText: UIStrings.emailAddress,
            border: InputBorder.none,
            labelStyle: theme.textTheme.bodyText2.copyWith(
              fontSize: 18.sp,
              color: AppColors.grey400,
            )),
        controller: _usernameController,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: true,
        autofillHints: [AutofillHints.username],
        style: theme.textTheme.bodyText2.copyWith(
          fontSize: 18.sp,
          color: AppColors.grey800,
        ),
      ),
    );
  }

  Widget passwordTextField(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(3.0))),
      child: TextFormField(
        key: Key('password-text-field-key'),
        focusNode: _passwordFocusNode,
        decoration: InputDecoration(
            isDense: true,
            labelText: UIStrings.password,
            border: InputBorder.none,
            labelStyle: theme.textTheme.bodyText2.copyWith(
              fontSize: 18.sp,
              color: AppColors.grey400,
            )),
        controller: _passwordController,
        autocorrect: false,
        obscureText: true,
        autofillHints: [AutofillHints.password],
        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(' '))],
        style: theme.textTheme.bodyText2.copyWith(
          fontSize: 18.sp,
          color: AppColors.grey800,
        ),
      ),
    );
  }
}
