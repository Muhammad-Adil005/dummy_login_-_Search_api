import 'dart:convert';

class FFConvert {
  FFConvert._();

  static T? Function<T extends Object?>(dynamic value) convert = <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e) {
    return defaultValue;
  }

  return defaultValue;
}

T? ifPresent<T extends Object?>(
  Map<String, dynamic> json,
  String key, [
  T? defaultValue,
]) {
  if (json.containsKey(key)) {
    return asT<T>(json[key]);
  }

  return defaultValue;
}
