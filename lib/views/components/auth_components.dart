import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/*
componentes para el login
*/
class LogoAuthComponent extends StatelessWidget {
  const LogoAuthComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Column(
      spacing: size.height * .02,
      children: [
        SizedBox(
          height: size.height * .13,
          child: Image.asset(isDarkMode
              ? ImagesAssetsPath.bannerLogoDark
              : ImagesAssetsPath.bannerLogoLight),
        ),
        Text(
          'Movie App',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}

/*
componente para el row que dice "iniciar sesiòn con"
*/
class LineRowComponent extends StatelessWidget {
  final String title;

  const LineRowComponent({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * .001,
          width: size.width * .2,
          decoration: BoxDecoration(
            color: PaletteTheme.greyColor,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: PaletteTheme.greyColor,
              ),
        ),
        const Spacer(),
        Container(
          height: size.height * .001,
          width: size.width * .2,
          decoration: BoxDecoration(
            color: PaletteTheme.greyColor,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}

/*
richt text
*/
class LoginRichText extends StatelessWidget {
  final String title;
  final String subtitle;
  const LoginRichText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 2,
      text: TextSpan(
          text: title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 12, fontWeight: FontWeight.w100),
          children: [
            TextSpan(
              text: subtitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ]),
    );
  }
}

class SocialNetworkComponent extends StatelessWidget {
  final String icon;
  final bool isLoading;
  final Function onTap;
  const SocialNetworkComponent({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteThree,
        ),
        child: Center(
          child: isLoading
              ? LoadingComponents()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .03,
                      child: Image.asset(
                        icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: size.width * .02),
                    Text(
                      'Iniciar sesión en Google',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

/*
richt text
*/
class LoginRichTextOnTap extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  const LoginRichTextOnTap({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 2,
      text: TextSpan(
          text: title,
          style: TextTheme.of(context)
              .bodyLarge!
              .copyWith(fontSize: 17, fontWeight: FontWeight.w100),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () => onTap(),
              text: subtitle,
              style: TextTheme.of(context).bodyLarge!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    // color: PaletteTheme.purpleTwo,
                  ),
            )
          ]),
    );
  }
}
