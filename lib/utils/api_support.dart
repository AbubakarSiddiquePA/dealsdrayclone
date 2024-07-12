class ApiSupport {
  static String baseUrl = "http://devapiv4.dealsdray.com";

//ENDPOINTS
  static String sentOtp = "/api/v2/user/otp";
  static String registerDeviceInfo = "/api/v2/user/device/add";
  static String verifyOtp = '/api/v2/user/otp/verification';
  static String addUserDetails = "/api/v2/user/email/referral";
  static String getProducts = "/api/v2/user/home/withoutPrice";

//HEADER
  static Map<String, String> get headers => {
        'Content-Type': 'application/json',
      };
}
