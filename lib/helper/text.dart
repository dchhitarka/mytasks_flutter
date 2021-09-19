import 'package:flutter/material.dart';

text({
  title,
  size,
  color,
}) =>
    Text(
      title,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
