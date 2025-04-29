import "package:flutter/material.dart";

class LoadingScreen extends StatelessWidget
{
  const LoadingScreen(
    {
      this.exception,
      required this.onTryAgain,
      super.key
    }
  );

  final Exception? exception;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context)
  {
    
  }
}